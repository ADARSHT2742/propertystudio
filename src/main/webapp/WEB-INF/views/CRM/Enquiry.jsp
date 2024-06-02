<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User name | My Enquiries</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSSFiles/Enquiry.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>

    <body>


        <div class="container mt-3">
            <div class="hflex">
                <div>
                    <h1>Your Enquiries</h1>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" id="enquiryFormButton">
                        <i class="fas fa-plus"></i> Create Enquiry
                    </button>
                    <button type="button" class="btn btn-success" id="excelDownloadButton" download="EnquiriesList(Username).xlsx">
                        <i class="fas fa-download"></i> Excel Download
                    </button>
                </div>
            </div>
        </div>

        <div class="container">
            <div id="enquiryTilesContainer"></div>
        </div>

        <!-- Modal For Enquiry details -->
        <div class="modal fade" id="enquiryModal" tabindex="-1" role="dialog" aria-labelledby="enquiryModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="enquiryModalLabel">Enquiry Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Enquiry ID:</strong> <span id="modalEnquiryId"></span></p>
                        <p><strong>Name:</strong> <span id="modalClientName"></span></p>
                        <p><strong>Email:</strong> <span id="modalClientEmail"></span></p>
                        <p><strong>Mobile:</strong> <span id="modalClientMobile"></span></p>
                        <p><strong>Address:</strong> <span id="modalClientAddress"></span></p>
                        <p><strong>Location:</strong> <span id="modalClientLocation"></span></p>
                        <p><strong>Pincode:</strong> <span id="modalClientPincode"></span></p>
                        <p><strong>City:</strong> <span id="modalClientCity"></span></p>
                        <p><strong>Profession:</strong> <span id="modalClientProfession"></span></p>
                        <p><strong>Locality:</strong> <span id="modalClientLocality"></span></p>
                        <p><strong>Source:</strong> <span id="modalClientSource"></span></p>
                        <p><strong>Project:</strong> <span id="modalProjectName"></span></p>
                        <p><strong>Project Component:</strong> <span id="modalProjectComponent"></span></p>
                        <p><strong>Remarks:</strong> <span id="modalRemarks"></span></p>
                        <p><strong>Date:</strong> <span id="modalDate"></span></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Enquiry Creation Form-->
        <div class="modal fade" id="EnquiryCreationModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Client Enquiry Form</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="createEnquiry" id="enquiryForm">
                            <!-- Client Personal Information -->
                            <fieldset class="module vflex">
                                <legend>Client Personal Information</legend>
                                <div class="hflex">
                                    <!-- Contact Information -->
                                    <div class="module">
                                        <legend>Contact Information</legend>
                                        <div class="form-group">
                                            <label for="client-name">Name:</label>
                                            <input type="text" class="form-control" id="client-name" name="clientName"
                                                required>
                                        </div>
                                        <div class="form-group">
                                            <label for="client-email">Email:</label>
                                            <input type="email" class="form-control" id="client-email"
                                                name="clientEmail" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="client-mobile">Mobile Number:</label>
                                            <input type="text" class="form-control" id="client-mobile"
                                                name="clientMobile" maxlength="10" pattern="\d{10}"
                                                title="Please enter a valid 10-digit mobile number" required>
                                        </div>
                                    </div>
                                    <!-- Address Information -->
                                    <div class="module">
                                        <legend>Address Information</legend>
                                        <div class="form-group">
                                            <label for="client-address">Address:</label>
                                            <textarea class="form-control" id="client-address" name="clientAddress"
                                                required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="client-location">Location:</label>
                                            <input type="text" class="form-control" id="client-location"
                                                name="clientLocation" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="client-pincode">Pincode:</label>
                                            <input type="text" class="form-control" id="client-pincode"
                                                name="clientPincode" maxlength="6" pattern="\d{6}"
                                                title="Please enter a valid 6-digit pincode" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="client-city">City:</label>
                                            <input type="text" class="form-control" id="client-city" name="clientCity"
                                                required>
                                        </div>
                                    </div>
                                    <!-- Other Information -->
                                    <div class="module">
                                        <legend>Other Information</legend>
                                        <div class="form-group">
                                            <label for="client-profession">Profession:</label>
                                            <input type="text" class="form-control" id="client-profession"
                                                name="clientProfession" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="client-locality">Locality:</label>
                                            <select class="form-control" id="client-locality" name="clientLocality"
                                                required>
                                                <option value="">Select Locality</option>
                                                <option value="LCL">Local</option>
                                                <option value="NRI">NRI</option>
                                                <option value="OUS">Outsource</option>
                                                <option value="OTHR">Other</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="client-source">Source:</label>
                                            <select class="form-control" id="client-source" name="clientSource"
                                                required>
                                                <option value="">Select Source</option>
                                                <option value="SM">Social Media</option>
                                                <option value="NP">News Papers</option>
                                                <option value="AD">Advertisements</option>
                                                <option value="OTHR">Others</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <!-- Enquiry Project Information -->
                            <fieldset class="module vflex mt-4">
                                <legend>Enquiry Project Information</legend>
                                <div class="hflex">
                                    <!-- Project Details -->
                                    <div class="module-50">
                                        <legend>Project Details</legend>
                                        <div class="form-group">
                                            <label for="project-name">Project Name:</label>
                                            <select class="form-control" id="project-name" name="projectName" required>
                                                <option value="">Select Project</option>
                                                <option value="proj1">Project 1</option>
                                                <option value="proj2">Project 2</option>
                                                <option value="proj3">Project 3</option>
                                                <option value="proj4">Project 4</option>
                                                <option value="proj5">Project 5</option>
                                                <option value="proj6">Project 6</option>
                                                <option value="proj7">Project 7</option>
                                                <option value="proj8">Project 8</option>
                                                <option value="proj9">Project 9</option>
                                                <option value="proj10">Project 10</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Component of Project:</label><br>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="projectComponent"
                                                    id="apartments" value="Apartments" required>
                                                <label class="form-check-label" for="apartments">Apartments</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="projectComponent"
                                                    id="villas" value="Villas" required>
                                                <label class="form-check-label" for="villas">Villas</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="projectComponent"
                                                    id="commercial" value="Commercial Complex Block" required>
                                                <label class="form-check-label" for="commercial">Commercial Complex
                                                    Block</label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Remarks -->
                                    <div class="module-50">
                                        <legend>Remarks</legend>
                                        <div class="form-group">
                                            <label for="EnquiryFormRemarks">Remarks:</label>
                                            <textarea class="form-control" id="EnquiryFormRemarks" name="remarks"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <!-- Sales Executive Information -->
                        <div class="mr-auto">
                            <p class="mb-1">Sales Executive Id:</p>
                            <p id="clock"></p>
                        </div>

                        <!-- Server Response Messages For Enquiry Creation-->
                        <div class="flex-grow-1">
                            <p id="EnquiryFormMessages" class="text-center mb-1"></p>
                        </div>

                        <!-- Create Enquiry -->
                        <div>
                            <button type="button" class="btn btn-primary" id="enquiryCreationButton">Submit</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Modal for Site Visit Request Form-->
        <div class="modal fade" id="SiteVisitModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Enquiry Site Visit Details</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form id="siteVisitForm">
                            <div class="form-group">
                                <label for="enquiryId">Enquiry ID:</label>
                                <input type="text" id="enquiryId" class="form-control" disabled>
                            </div>

                            <div class="form-group">
                                <label for="enquiryName">Enquiry Person Name:</label>
                                <input type="text" id="enquiryName" class="form-control" disabled>
                            </div>

                            <!-- Remarks -->
                            <div class="form-group">
                                <label for="SiteVisitRemarks">Remarks:</label>
                                <textarea id="SiteVisitRemarks" class="form-control" rows="3"></textarea>
                            </div>

                            <!-- Status (dropdown) -->
                            <div class="form-group">
                                <label for="status">Status:</label>
                                <select id="status" class="form-control">
                                    <option value="active">Active</option>
                                    <option value="not_active">Not Active</option>
                                </select>
                            </div>
                        </form>
                    </div>


                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <!-- Sales Executive Information -->
                        <div class="mr-auto">
                            <p class="mb-1">Sales Executive Id:</p> <!-- Here name of the sales executive -->
                            <p id="clock"></p>
                        </div>

                        <!-- Server Response Messages For Site Visit Request Creation -->
                        <div class="flex-grow-1">
                            <p id="SiteVisitMessages" class="text-center mb-1"></p>
                        </div>

                        <!-- Create Enquiry -->
                        <div>
                            <button type="button" class="btn btn-primary" id="siteVistComletedButton">Submit</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- JavaScript libraries for Bootstrap -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/JSFiles/Enquiry.js"></script>

    </body>

    </html>