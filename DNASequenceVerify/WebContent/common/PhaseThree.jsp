<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Phase Three</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/Normal.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jQuery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ajaxfileupload.js"></script>
</head>
<script type="text/javascript">
function testphasethree()
{
	//parameter
	var form=$('#parameter');
	var kfold=form.find("input[name='kFold']").val();
	var cvalue=form.find("input[name='cValue']").val();
	if(kfold!=""&&cvalue!="")
	{
		$.ajax({
			url:"http://169.226.135.21:5000/DNASequenceVerify/servlet/RunPhaseThreeService",
			type:"post",
			dataType:"json",
			contentType :"application/x-www-form-urlencoded; charset=utf-8",
	        data:$('#parameter').serialize(),
	        beforeSend:function()
        		{
        			$("#submit").attr({disabled:"disabled"});
        			$("#load-layout").show();
			},
 			complete:function()
			{
			
			},
	        success:function(data)
			{
				$("#load-layout").hide();
				$("#submit").removeAttr("disabled");
	        	//var filename=data[0].output.toString().substring(data[0].output.toString().lastIndexOf("/")+1);
				//window.location.href="/DNASequenceVerify/servlet/UpdatePhaseThreeService?filename="+filename+"&kfold="+kfold+"&cvalue="+cvalue;
				window.location.href="/DNASequenceVerify/servlet/UpdatePhaseThreeService?kfold="+kfold+"&cvalue="+cvalue;
			},
			error:function(err)
			{
				$("#load-layout").hide();
				$("#submit").removeAttr("disabled");
				alert("Test error");
			}
		});
	}
	else if(kfold=="")
	{
		alert("K Fold is empty!");
	}
	else if(iteration=="")
	{
		alert("iteration number is empty!");
	}
	else if(cvalue=="")
	{
		alert("Value of c is empty!");
	}
}
</script>
<body>
<%@include file="taglib.jsp" %>
<div id="load-layout" style="position:fixed;width:100%;height:100%;filter:alpha(opacity=20);opacity:0.1;background:#000;display:none">
	<div style="position:absolute;left:38%;top:200px;">
		<img src="${basePath}/static/image/timg.gif"/>
	</div>
	<c:out value="Please waitting the result"/>
</div>

	<div class="main">
			<div class="menu">
     			<ul>
     			<li>
     				<c:choose>
         				<c:when test="${empty sessionScope.userbean}">
         					<span><a href="${pageContext.request.contextPath}/common/Index.jsp" >Log in</a></span>
         				</c:when>
         
         				<c:otherwise>
         					<span>Welecome, ${sessionScope.userbean.getUsername()}</span>
         					<Span>|</Span>
         					<Span><a href="${pageContext.request.contextPath}/servlet/LogoutService">Log out</a></Span>
         				</c:otherwise>
      				</c:choose>
      			</li>
     			    
          			<li><a href="${pageContext.request.contextPath}/servlet/ListFileService">File list</a></li>
          			<li><a href="${pageContext.request.contextPath}/servlet/ListExperimentService">Experiment list</a></li>
          			<li><a href="${pageContext.request.contextPath}/common/Profile.jsp">Profile</a></li>
          			<li>${link}</li>
     			</ul>
     	 	</div>
		    <div class="list" style="float:right;width:40%; background:#FF5688">
				<ul>
					<li><c:out value="Experiment name: ${expbean.getExpname()}"/></li>
					<li><c:out value="FP value: ${expbean.getFp()}"/></li>
					<li><c:out value="FN value: ${expbean.getFn()}"/></li>
					<li><c:out value="Input file: ${inputfilename}"/></li>
					<li><c:out value="Phase one result file name: "/></li>
					<li><c:out value="${phaseonefilename}"/></li>

					<form action="${pageContext.request.contextPath}/servlet/DownloadService" method="post">
						<input type="hidden" name="fileid" value="${expbean.getPhaseonefileid()}">
						<li><input type="submit" value="Download phase one result"></li>
					</form>
					
					<li><c:out value="Motifs number: ${expbean.getMotifsnumber()}"/></li>
					<li><c:out value="Feature selection: ${expbean.getFeatureselection()}"/></li>
					<li><c:out value="Extra feature: ${expbean.getExtrafeature()}"/></li>
					<li><c:out value="Phase two result file name: "/></li>
					<li><c:out value="${phasetwofilename}"/></li>
					
					<form action="${pageContext.request.contextPath}/servlet/DownloadService" method="post">
						<input type="hidden" name="fileid" value="${expbean.getPhasetwofileid()}">
						<li><input type="submit" value="Download phase two result"></li>
					</form>
					</ul>
			</div>
			<div class="list">
					<ul>
					<li>Phase 3: Classification</li>
					<form id="parameter">
         			<li ><c:out value="K fold"/></br><input type="text" name="kFold" value="${expbean.getKfold()}"/></li>
         			<li><c:out value="The value of c(SVM parameter)"/></br><input type="text" name="cValue" value="${expbean.getCvalue()}"/></li>
         			<li><input type="button" value="Countinue" name="submit" onclick="testphasethree();"></li>
					</form>
					<li><input type="button" onclick="window.location.href='/DNASequenceVerify/servlet/ReturnPreviousPhaseService'" value="Return to phase two"></li>
					</ul>
			</div>
				
		</div>
	
</body>
</html>