package mvc.test.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mvc.test.admin.service.AdminService;
import mvc.test.board.service.EventBoardService;
import mvc.test.controller.domain.AdminVO;
import mvc.test.controller.domain.CategoryVO;
import mvc.test.controller.domain.EventBoardVO;
import mvc.test.controller.domain.EventPage;
import mvc.test.controller.domain.GoodsVO;
import mvc.test.controller.domain.GoodsViewVO;
import mvc.test.controller.domain.OrderListVO;
import mvc.test.controller.domain.UserVO;
import mvc.test.product.service.OrderService;
import mvc.test.utils.UploadFileUtils;
import net.sf.json.JSONArray;



@Controller
@RequestMapping("/Admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@Inject
	EventBoardService service;
	
	@Inject
	OrderService orderService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	// 관리자 로그인
		@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
		public String getAdminLogin() throws Exception{
			logger.info("get adminLogin");
			return "Admin/adminLogin";
		}
		
		@RequestMapping(value = "/adminLoginCheck",method=RequestMethod.POST)
		public String postAdminLogin(AdminVO adminVO,Model model,HttpServletRequest request) throws Exception {
			
			System.out.println("내가 입력한 admin id : " + adminVO.getAdmin_id());
			System.out.println("내가 입력한 admin pwd : " + adminVO.getAdmin_pw());
			
			AdminVO vo=adminService.login(adminVO);
			HttpSession session= request.getSession();
			
			if(vo == null || !adminVO.getAdmin_pw().equals(vo.getAdmin_pw())) {
				System.out.println("비번 틀려서 여기왔음");
				return "redirect:adminLoginPost";
			} else {
				System.out.println("비번 맞아서 여기왔음");
				session.setAttribute("admin", adminVO);
				
				return "redirect:adminListPage?num=1";
			}
			
		}
		
		// 로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession httpSession){
			
			httpSession.invalidate();
			
			return "Admin/logout";
		}
		
		
		// 회원목록
		@RequestMapping(value="/MemberList", method = RequestMethod.GET)
		public String memberList(Model model, UserVO userVO) throws Exception {
			List<UserVO> list = adminService.userList(userVO);
			logger.info("userList : " + adminService.userList(userVO));
			
			model.addAttribute("list",list);
			return "Admin/MemberList";
		}
		
		@RequestMapping(value = "/memberBan", method = RequestMethod.POST)
		public @ResponseBody Map<String, String> memberBan(@RequestParam("users_id") String userId, HttpSession session, RedirectAttributes rttr) throws Exception {
		    System.out.println("아이디 = " + userId);
		    adminService.memberBan(userId);
		    
		    Map<String, String> response = new HashMap<>();
		    response.put("result", "success");
		    return response;
		}

		
	
		
	//게시물 목록 + 페이징 추가
	@RequestMapping(value = "/adminListPage", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num) throws Exception {
		
		EventPage page = new EventPage();
			
		page.setNum(num);
		page.setCount(service.count());  

		List<EventBoardVO> list = null; 
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
		model.addAttribute("page", page);
		model.addAttribute("select", num);
			
	}
		
	//게시물 작성
		@RequestMapping(value="/adminEventBoardwrite", method=RequestMethod.GET)
	    public void getWrite() throws Exception {
			
	    }
		
		//게시물 작성
		@RequestMapping(value="/adminEventBoardwrite", method=RequestMethod.POST)
	    public String postWrite(EventBoardVO vo) throws Exception {
			service.write(vo);
			
			return "redirect:/Admin/adminListPage?num=1";
	    }
		
		//게시물 조회
		@RequestMapping(value="/adminEventBoardview", method=RequestMethod.GET)
		public void getView(@RequestParam("bno") int bno, Model model) throws Exception {

			service.viewCnt(bno);
			
			EventBoardVO vo = service.view(bno);
			
			model.addAttribute("view", vo);
			

		}
		
		//게시물 수정
		@RequestMapping(value="/adminEventBoardmodify", method=RequestMethod.GET)
	    public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
			
			EventBoardVO vo = service.view(bno);
			
			model.addAttribute("view", vo);
			
	    }
		
		//게시물 수정
		@RequestMapping(value="/adminEventBoardmodify", method=RequestMethod.POST)
	    public String postModify(EventBoardVO vo) throws Exception {
			service.modify(vo);
			
			return "redirect:/Admin/adminEventBoardview?bno=" + vo.getBno();
	    }
		
		//게시물 삭제
		@RequestMapping(value="/EventBoarddelete", method=RequestMethod.GET)
	    public String postDelete(@RequestParam("bno") int bno) throws Exception {
			service.delete(bno);
			
			return "redirect:/Admin/adminListPage?num=1";
	    }
		
		// 상품 관리자 화면
		@RequestMapping(value = "/adminProductPage", method = RequestMethod.GET)
		public void getadminProductPage() throws Exception{
		logger.info("get adminProductPage");
		}
		
		/*
		 * @RequestMapping(value = "/regProduct", method = RequestMethod.GET) public
		 * String getRegProduct() throws Exception { return "Admin/regProduct"; }
		 */
		
		// 상품 등록(GET)
		@RequestMapping(value = "/regProduct", method = RequestMethod.GET)
		public void getRegProduct(Model model) throws Exception {
			logger.info("get regProduct");
			
			List<CategoryVO> category = null;
			category = adminService.category();
			model.addAttribute("category", JSONArray.fromObject(category));
	  }
		

		//상품 등록(POST)
		@RequestMapping(value= "/regProduct", method = RequestMethod.POST)
		public String PostRegProduct(GoodsVO vo, MultipartFile file) throws Exception {
			
			String imgUploadPath = uploadPath + "/" + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;
			
			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
				  
				  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

				  // gdsImg에 원본 파일 경로 + 파일명 저장
				  vo.setGdsImg("/" + "imgUpload" + ymdPath + "/" + fileName);
				  // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
				  vo.setGdsThumbImg("/" + "imgUpload" + ymdPath + "/" + "s" + "/" + "s_" + fileName);
				  
				 } else {  // 첨부된 파일이 없으면
				  fileName = "/" + "images" + "/" + "none.png";
				  // 미리 준비된 none.png파일을 대신 출력함
				  
				  vo.setGdsImg(fileName);
				  vo.setGdsThumbImg(fileName);
				 }
			
			adminService.register(vo);
			
			return "redirect:/Admin/adminProductPage";
		}
		
		// 상품 목록
		@RequestMapping(value = "/adminProductList", method = RequestMethod.GET)
		public void getGoodsList(Model model) throws Exception {
			logger.info("get goods list");
			
			List<GoodsVO> list = adminService.goodslist();
			
			model.addAttribute("list",list);
		}
		
		  // 상품 조회
		  @RequestMapping(value = "/regProductView", method = RequestMethod.GET) public
		  void getRegProductView(@RequestParam("n") int gdsNum, Model model) throws
		  Exception { logger.info("get regProductView"); // n -> ?n = url 번호
		  
		  GoodsViewVO goods = adminService.regProductView(gdsNum);
		  model.addAttribute("goods", goods); }
	     
		   // 상품 수정 GET
			@RequestMapping(value = "/modifyProduct", method = RequestMethod.GET)
			public void getModifyProduct(@RequestParam("n") int gdsNum, Model model) throws Exception{
			logger.info("get modifyProduct");
			
			GoodsViewVO goods = adminService.regProductView(gdsNum);
			model.addAttribute("goods", goods);
			
			List<CategoryVO> category = null;
			category = adminService.category();
			model.addAttribute("category", JSONArray.fromObject(category));
			}
			
			// 상품 수정 POST
			@RequestMapping(value = "/modifyProduct", method = RequestMethod.POST)
			public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
				 logger.info("post goods modify");

				 // 새로운 파일이 등록되었는지 확인
				 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				  // 기존 파일을 삭제
				  new File(uploadPath + req.getParameter("gdsImg")).delete();
				  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
				  
				  // 새로 첨부한 파일을 등록
				  String imgUploadPath = uploadPath + "/" + "imgUpload";
				  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
				  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				  
				  vo.setGdsImg("/" + "imgUpload" + ymdPath + "/" + fileName);
				  vo.setGdsThumbImg("/" + "imgUpload" + ymdPath + "/" + "s" +"/" + "s_" + fileName);
				  
				 } else {  // 새로운 파일이 등록되지 않았다면
				  // 기존 이미지를 그대로 사용
				  vo.setGdsImg(req.getParameter("gdsImg"));
				  vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
				  
				 }
				 
				 adminService.goodsModify(vo);
			 
			 return "redirect:/Admin/adminProductList";
			}
			
			// 상품 삭제 POST
			@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
			public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
			 logger.info("post goods delete");

			 adminService.goodsDelete(gdsNum);
			 
			 return "redirect:/Admin/adminProductList";
			}
			
			// 상품 삭제 GET
			@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
			public void getGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
			 logger.info("post goods delete");

			 adminService.goodsDelete(gdsNum);	
			}
		
		// 관리자가 보는 전체 주문 목록
		@RequestMapping(value="/Orderlist", method = RequestMethod.GET)
		public void totalList(Model model) throws Exception{
			List<OrderListVO> totallist = orderService.list();
			System.out.println("주문 목록 : "+totallist);
			model.addAttribute("totallist",totallist);
		}
}
