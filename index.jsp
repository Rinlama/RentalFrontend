<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="header.jsp"%>

<%@page import="java.util.List"%>

<%
	String value = (String) request.getAttribute("error");
	if (value == "valueerror") {
	out.print("<span data-toggle='modal' data-target='.bs-example-modal-lg' id='modal'></span>");
	}
%>
<div class="container">
	<div class="row centered-form">
		<h2>Welcome to Housing Content</h2>
		<div
			class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Login</h3>
				</div>
				<div class="panel-body">

					<form role="form" action="LoginUser" method="POST">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">

								<div class="form-group">
									<input type="email" name="email" id="email"
										class="form-control input-sm" placeholder="Email Address"
										required>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="form-group">
									<input type="password" name="password" id="password"
										class="form-control input-sm" placeholder="Password" required>
								</div>
							</div>

						</div>

						<input type="submit" value="Register"
							class="btn btn-info btn-block">

					</form>
				</div>
			</div>
		</div>


	</div>
	<!-- /container -->

</div>
<!-- /container -->
<!-- Model start -->

<div class="row">
	<!-- Large modal -->
	

	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-body">

					<h4>Please enter a Correct Email or Password</h4>

				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
document.getElementById("modal").click();
</script>
<%@ include file="footer.jsp"%>

