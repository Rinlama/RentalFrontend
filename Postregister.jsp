
<%@ page import="Business.User"%>

<%@ include file="postregisterheader.jsp"%>
<body>
	<div class="container">
		<div class="container">
			<div class="row centered-form">
				<h2>Post Your classified</h2>
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<!--  <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4"> -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								Post your classified <small>It's free!</small>
							</h3>
						</div>
						<div class="panel-body">


							<form role="form" action="RegisterPost" method="POST"
								enctype="multipart/form-data">
								<div class="row">
									<input type="text" name="userid" class="form-control input-sm"
										placeholder=""
										value="<%out.print(request.getParameter("idUser"));%>">
									<div class="col-xs-12 col-sm-12 col-md-12">
										<div class="form-group">
											<input type="text" name="name" id="name"
												class="form-control input-sm" placeholder="*Name" required>
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-12">
										<div class="form-group">
											<input type="text" name="subject" id="subject"
												class="form-control input-sm" placeholder="Subject">
										</div>
									</div>
								</div>

								<div class="form-group">
									<input type="email" name="email" id="email"
										class="form-control input-sm" placeholder="*Email Address"
										required>
								</div>

								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12">
										<div class="form-group">
											<input type="phone" name="phone" id="phone"
												class="form-control input-sm"
												placeholder="Phone Number Optional" />
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-12">
										<div class="form-group">

											<textarea type="text" class="form-control" rows="7"
												id="description" name="description"
												placeholder="Description"></textarea>
										</div>
									</div>
									<br>

									<div class="col-xs-12 col-sm-12 col-md-4">
										<div class="btn btn-info btn-block">
											<input type="file" name="imgone" id="imgone" />
										</div>
									</div>

								
								</div>
								<br>
								<input type="submit" class="btn btn-info btn-block">

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /container -->

</body>
<%@ include file="footer.jsp"%>