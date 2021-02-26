<%--
  Created by IntelliJ IDEA.
  User: Choeurtis
  Date: 18/02/2021
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="j" %>

<html>
<head>
    <title>Documents</title>
    <%@include file="../utils/include.jsp"%>
    <link rel="stylesheet" href="<j:url value="/resources/css/app.css"/>">
</head>
<body>
    <div class="main-container">
        <div class="body-container">
            <header class="header">
                <h1>Welcome to our catalog of documents</h1>
                <button id="new-doc-btn" class="button">Add a document</button>
            </header>
            <div class="container is-fluid my-6">
                <div class="columns is-multiline">
                    <j:choose>
                        <j:when test="${empty requestScope.documents}">
                            No documents available
                        </j:when>
                        <j:otherwise>
                            <j:forEach items="${requestScope.documents}" var="document">
                                <div class="column is-4">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="card-header-title"><j:out value="${document.data()[1]}" /></h5>
                                        </div>
                                        <div class="card-content">
                                            <div class="content">
                                                <j:choose>
                                                    <j:when test="${ !empty document.data()[2]}">
                                                        <p><j:out value="${document.data()[2]}" /></p>
                                                    </j:when>
                                                    <j:otherwise>
                                                        <p>No description</p>
                                                    </j:otherwise>
                                                </j:choose>
                                                <p>
                                                    State :
                                                    <j:choose>
                                                        <j:when test="${ document.data()[4] == 'Free'}">Is free</j:when>
                                                        <j:when test="${ document.data()[4] == 'Borrowed'}">Is borrowed</j:when>
                                                    </j:choose>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <button
                                                    id="delete-doc-btn"
                                                    class="card-footer-item"
                                                    doc-id="<j:out value="${document.data()[0]}"/>"
                                            >
                                                Delete
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </j:forEach>
                        </j:otherwise>
                    </j:choose>
                </div>
            </div>
        </div>
        <footer class="footer-container">
            <a href="../index.jsp">Return to home page</a>
        </footer>
    </div>

    <%@include file="./modals/newDocument.jsp"%>
    <%@include file="./modals/deleteDocument.jsp"%>

    <script defer src="<j:url value="/resources/js/catalog.js"/>"></script>
</body>
</html>
