<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%!public class Dto {
		public String title;
		public String date;
		public String writer;

		public String getTitle() {
			return title;
		}

		public String getDate() {
			return date;
		}

		public String getWriter() {
			return writer;
		}

		public Dto() {
		}

		public Dto(String title, String date, String writer) {
			this.title = title;
			this.date = date;
			this.writer = writer;
		}

	}%>
<%
ArrayList<Dto> li = new ArrayList<>();
ArrayList<String> strings = new ArrayList<>();
li.add(new Dto("Title AAA", "12.27", "KIM"));
li.add(new Dto("Title BBB", "12.27", "KIM"));
li.add(new Dto("Title EEE", "12.27", "KIM"));
li.add(new Dto("Title DDD", "12.27", "KIM"));
li.add(new Dto("Title FFF", "12.27", "KIM"));
li.add(new Dto("Title AAA", "12.27", "KIM"));
request.setAttribute("li", li);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
<link href="reset.css" type="text/css" rel="stylesheet">
<link href="index-style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="container-background">
		<h1>해야할 일</h1>
		<div class="card-stack-container">
			<ul id="todo" class="card-stack">
				<li class="card-stack-header"><p>TODO</p></li>
				<c:forEach items="${li}" var="item">
					<li class="card">
						<h3 class="card-title"><c:out value="${item.getTitle() }"/></h3>
						<p class="card-metadata">작성일: <c:out value="${item.getDate() }"/> 작성자: <c:out value="${item.getWriter() }"/></p>
						<button class="card-progressing">&gt;&gt;&gt;</button>
					</li>
				</c:forEach>
			</ul>
			<ul id="doing" class="card-stack">
				<li class="card-stack-header"><p>DOING</p></li>
				<li class="card">
					<h3 class="card-title">자바스크립트 공부하기</h3>
					<p class="card-metadata">작성일: 11.11 작성자: 김김김</p>
					<button class="card-progressing">&gt;&gt;&gt;</button>
				</li>
			</ul>
			<ul id="done" class="card-stack">
				<li class="card-stack-header"><p>DONE</p></li>
				<li class="card">
					<h3 class="card-title">자바스크립트 공부하기!!</h3>
					<p class="card-metadata">작성일: 11.11 작성자: 김김김</p>
				</li>
				<li class="card">bye</li>
			</ul>
		</div>
	</div>
</body>
</html>