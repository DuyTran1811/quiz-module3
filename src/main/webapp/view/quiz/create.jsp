<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

<body style="background-color: #23395d">
<div class="container-fluid">
    <div class="container-fluid">
        <div class="row">
            <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%">
                <div class="col-md-4">
                    <a href="/quiz"><img src="/session/images/logo.jpg" width="90px" height="50px"></a>
                </div>
                <div class="col-md-2 offset-6">
                    <a class="nav-link" href="/users?action=login">Log Out</a>
                </div>
            </nav>
        </div>

        <div class="row">
            <div class="modal-dialog col-md-3" style="float: left">
                <div class="modal-content">
                    <form class="text-center" name="abc" style="color: black; padding: 20px; background-color: white"
                          action="/quiz?action=create&idquiz=${idquiz}"
                          method="post">
                        <div>
                            <h3>Create</h3>
                        </div>
                        <div class="form-group">
                            <h5>Quiz ID: ${idquiz}</h5>

                            <h5>Viết Câu Hỏi</h5>
                            <input type="text" name="namequestion" class="form-control"/>
                        </div>

                        <h5>Câu 1</h5>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="radio" name="correct" value="a1"
                                           aria-label="Radio button for following text input">
                                </div>
                            </div>
                            <input id="cau1" type="text" name="answer1" class="form-control"
                                   aria-label="Text input with radio button">
                            <p id="p1"></p>
                        </div>

                        <h5>Câu 2</h5>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="radio" name="correct" value="a2"
                                           aria-label="Radio button for following text input">
                                </div>
                            </div>
                            <input id="cau2" type="text" name="answer2" class="form-control"
                                   aria-label="Text input with radio button">
                            <p id="p2"></p>
                        </div>

                        <h5>Câu 3</h5>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="radio" name="correct" value="a3"
                                           aria-label="Radio button for following text input">
                                </div>
                            </div>
                            <input id="cau3" type="text" name="answer3" class="form-control"
                                   aria-label="Text input with radio button">
                            <p id="p3"></p>
                        </div>
                        <h5>Câu 4</h5>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input type="radio" name="correct" value="a4"
                                           aria-label="Radio button for following text input">
                                </div>
                            </div>
                            <input id="cau4" type="text" name="answer4" class="form-control"
                                   aria-label="Text input with radio button">
                            <p id="p4"></p>
                        </div>
                        <br/>
                        <span id="spnError" class="error" style="display: none">BJHJHJHJHJHJH</span>
                        <br/>
                        <div>
                            <button class="btn btn-outline-info btn-rounded z-depth-0 my-4 waves-effect" id="submit"
                                    type="submit">
                                Submit
                            </button>
                            <a href="/quiz" class="btn btn-secondary">Back</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-9">
                <table class="table table-striped" style="background-color: white; text-align: center">
                    <thead>
                    <tr>
                        <th scope="col">Question ID</th>
                        <th scope="col">Tên Quiz</th>
                        <th scope="col">Tên Câu Hỏi</th>
                        <th scope="col">Câu 1</th>
                        <th scope="col">Câu 2</th>
                        <th scope="col">Câu 3</th>
                        <th scope="col">Câu 4</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${lisqq}" var="listqq">
                        <tr>
                            <th scope="row">${listqq.id}</th>
                            <td>${listqq.contents}</td>
                            <td>${listqq.quizName}</td>
                            <td>${listqq.answer1}</td>
                            <td>${listqq.answer2}</td>
                            <td>${listqq.answer3}</td>
                            <td>${listqq.answer4}</td>
                            <td>
                                <a href="/quiz?action=delete&id=${listqq.id}&idquiz=${idquiz}">
                                    <button type="button" class="btn btn-danger">DELETE</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
        integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
<script>
</script>
</body>
</html>
