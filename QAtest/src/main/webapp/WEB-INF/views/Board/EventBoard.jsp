<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- 부트스트랩 -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <style>
      /* class="row" 너비 크기 조정 */
      .row {
        max-width: 80%;
        margin: 0 auto;
      }
    </style>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
         <script type="text/javascript">   
         $(document).ready( function() {
         
         $("#header").load("../Interface/header.jsp");
         $("#footer").load("../Interface/footer.jsp");
         
         });
         </script>
  </head>
  <body>
    <!-- 헤더 -->
    <div id="header"></div>
    <div style="display: inline-block; margin-top: 50px; position: relative; left: 14.5%;">
        <h1 style="font-size:40px; font-weight: bold;">이벤트 게시판</h1><p>
</div>
    <br>
      <div class="row">
          <div class="card-body p-sm-0">
            <form id="search-form" onsubmit="search(event)">
              <div class="row">
                <div class="row">
                  <div class="col-xxl-2">
                    <div style="position:relative; left: 170%;">
                      <select class="form-control" id="search-type" name="searchType">
                        <option>제목</option>
                        <option>내용</option>
                        <option>닉네임</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-10" style="position: relative; top:19%; left:25%;">
                    <label for="search-value" hidden></label>
                    <input type="text" placeholder="검색어..." class="form-control" id="search-value" name="searchValue">
                  </div>
                  <div class="col-lg-1 col-md-3 col-sm-12">
                    <button type="submit" class="btn btn-base" style="position: relative; top:18%; left:190%">
                      <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-search">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                      </svg>
                    </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
      </div>
      <div class="row w-75" style="position: relative; left: 15.5%;">
        <table class="table" id="article-table">
          <thead>
            <tr>
              <th class="number col-1"><a></a></th>
              <th class="title col-6"><a>제목</a></th>
              <th class="hashtag col-2"><a>구분</a></th>
              <th class="user-id"><a>작성자</a></th>
              <th class="created-at"><a>작성일</a></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="number"><a>1</a></td>
              <td class="title"><a href="#">첫글</a></td>
              <td class="hashtag">진행중</td>
              <td class="user-id">Uno</td>
              <td class="created-at">
                <time>2022-01-01</time>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td><a href="#">두번째글</a></td>
              <td>진행중</td>
              <td>Uno</td>
              <td>
                <time>2022-01-03</time>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td><a href="#">세번째글</a></td>
              <td>종료</td>
              <td>Uno</td>
              <td>
                <time>2022-01-03</time>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="row">
        <div class="d-grid gap-2 d-md-flex" style="position: relative; left: 80%;">
          <a class="btn btn-success">글삭제</a>
          <a href="Eventboardwrite.jsp" class="btn btn-success">글쓰기</a>
        </div>
      </div>
    <div class="row">
        <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
    </div>
   <!-- footer -->
   <div style="margin-top: 13%;" id="footer"></div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
  <script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.0.0.min.js"></script>
<script src="../js/plugin.js"></script>
</html>