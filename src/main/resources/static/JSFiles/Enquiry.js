$(document).ready(function () {
    function padZero(num) {
        return num.toString().padStart(2, '0');
    }

    function getDateTimeNow() {
        const now = new Date();
        const year = now.getFullYear();
        const month = padZero(now.getMonth() + 1); // Months are zero-based
        const day = padZero(now.getDate());
        const hours = padZero(now.getHours());
        const minutes = padZero(now.getMinutes());
        const seconds = padZero(now.getSeconds());

        const dateString = month + '/' + day + '/' + year;
        const timeString = hours + ':' + minutes + ':' + seconds;

        return dateString + ' ' + timeString;
    }

    function updateClock() {
        $('#clock').text(getDateTimeNow());
    }

    function createEnquiryTile(enquiry) {
        const enquiryTile = $('<div></div>').addClass('enquiryTile row');

        // Photo container
        const photo = $('<div></div>').addClass('photo col-md-2').append(
            $('<img>').attr('src', 'https://static.vecteezy.com/system/resources/thumbnails/006/687/545/small_2x/people-with-phone-the-man-is-talking-on-the-phone-image-vector.jpg').attr('alt', 'Customer Photo')
        );
        enquiryTile.append(photo);

        // Details container
        const detailsContainer = $('<div></div>').addClass('details col-md-3');
        const nameDetail = $('<p></p>').append($('<strong></strong>').text('Name: ')).append(document.createTextNode(enquiry.clientName));
        const emailDetail = $('<p></p>').append($('<strong></strong>').text('Email: ')).append(document.createTextNode(enquiry.clientEmail));
        const mobileDetail = $('<p></p>').append($('<strong></strong>').text('Mobile: ')).append(document.createTextNode(enquiry.clientMobile));

        detailsContainer.append(nameDetail, emailDetail, mobileDetail);
        enquiryTile.append(detailsContainer);

        // Project container
        const projectContainer = $('<div></div>').addClass('project col-md-4');
        const projectDetail = $('<p></p>').append($('<strong></strong>').text('Project: ')).append(document.createTextNode(enquiry.projectName));
        const componentDetail = $('<p></p>').append($('<strong></strong>').text('Component: ')).append(document.createTextNode(enquiry.projectComponent));
        const dateDetail = $('<p></p>').append($('<strong></strong>').text('Date: ')).append(document.createTextNode(new Date(enquiry.date).toLocaleString()));

        projectContainer.append(projectDetail, componentDetail, dateDetail);
        enquiryTile.append(projectContainer);

        // Buttons container
        const buttonsContainer = $('<div></div>').addClass('buttons col-md-3');
        const viewButton = $('<button></button>')
            .addClass('btn btn-primary mb-2')
            .text('View Enquiry')
            .attr('data-enquiry-id', enquiry.id)
            .on('click', function () {
                showModal(enquiry);
            });
        const requestButton = $('<button></button>')
            .addClass('btn btn-secondary siteVisitFormButton')
            .text('Request Site Visit')
            .attr('data-enquiry-id', enquiry.id)
            .on('click', function () {
                // use enquiry here

                $("#enquiryName").attr("value", enquiry.clientName);
                $("#enquiryId").attr("value", enquiry.id);

                $("#siteVisitForm")[0].reset();
                $("#SiteVisitMessages").text("");
                $('#SiteVisitModal').modal('show');
            });

        buttonsContainer.append(viewButton, requestButton);
        enquiryTile.append(buttonsContainer);

        return enquiryTile;
    }

    function showModal(enquiry) {
        $('#modalEnquiryId').text(enquiry.id);
        $('#modalClientName').text(enquiry.clientName);
        $('#modalClientEmail').text(enquiry.clientEmail);
        $('#modalClientMobile').text(enquiry.clientMobile);
        $('#modalClientAddress').text(enquiry.clientAddress);
        $('#modalClientLocation').text(enquiry.clientLocation);
        $('#modalClientPincode').text(enquiry.clientPincode);
        $('#modalClientCity').text(enquiry.clientCity);
        $('#modalClientProfession').text(enquiry.clientProfession);
        $('#modalClientLocality').text(enquiry.clientLocality);
        $('#modalClientSource').text(enquiry.clientSource);
        $('#modalProjectName').text(enquiry.projectName);
        $('#modalProjectComponent').text(enquiry.projectComponent);
        $('#modalRemarks').text(enquiry.remarks);
        $('#modalDate').text(new Date(enquiry.date).toLocaleString());
        $('#enquiryModal').modal('show');
    }

    function loadEnquiries() {
        $.ajax({
            url: 'http://localhost:8082/propertystudio/allEnquiries',
            method: 'GET',
            dataType: 'json',
            success: function (response) {
                const enquiries = response;
                const enquiryTilesContainer = $('#enquiryTilesContainer');
                enquiryTilesContainer.empty();
                if (enquiries.length === 0) {
                    enquiryTilesContainer.text("No enquiries on your account yet, Hurry Up & Generate Leads !").addClass("text-center mt-3");
                } else {
                    enquiries.forEach(function (enquiry) {
                        const enquiryTile = createEnquiryTile(enquiry);
                        enquiryTilesContainer.append(enquiryTile);
                    });
                }
            },
            error: function (xhr, status, error) {
                const enquiryTilesContainer = $('#enquiryTilesContainer');
                enquiryTilesContainer.text("No enquiries on your account yet, Hurry Up & Generate Leads !").addClass("text-center mt-3");
                console.error(xhr, status, error);
            }
        });
    }

    function flattenJSON(data, parent = '', res = {}) {
        for (let key in data) {
            const propName = parent ? parent + '.' + key : key;
            if (typeof data[key] === 'object' && !Array.isArray(data[key])) {
                flattenJSON(data[key], propName, res);
            } else {
                res[propName] = data[key];
            }
        }
        return res;
    }

    function downloadExcelFromJson(jsonData, filename = 'data.xlsx') {
        // Flatten the JSON data
        const flattenedData = jsonData.map(item => flattenJSON(item));

        // Convert JSON to worksheet
        const worksheet = XLSX.utils.json_to_sheet(flattenedData);

        // Create a new workbook
        const workbook = XLSX.utils.book_new();

        // Append the worksheet to the workbook
        XLSX.utils.book_append_sheet(workbook, worksheet, 'Sheet1');

        // Write the workbook to a binary string
        const excelData = XLSX.write(workbook, { bookType: 'xlsx', type: 'binary' });

        // Create a Blob from the binary string
        const blob = new Blob([s2ab(excelData)], { type: 'application/octet-stream' });

        // Create a link element and trigger the download
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = filename;
        link.click();
    }

    function s2ab(s) {
        const buf = new ArrayBuffer(s.length); // Convert s to ArrayBuffer
        const view = new Uint8Array(buf);
        for (let i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
        return buf;
    }

    loadEnquiries();

    updateClock();
    setInterval(updateClock, 1000);

    $("#enquiryFormButton").on("click", function () {
        $("#enquiryForm")[0].reset();
        $("#EnquiryFormMessages").text("");
        $('#EnquiryCreationModal').modal('show');
    });

    $("#enquiryCreationButton").on("click", function () {
        $.ajax({
            url: "http://localhost:8082/propertystudio/addEnquiry",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                "clientName": $("#client-name").val(),
                "clientEmail": $("#client-email").val(),
                "clientMobile": $("#client-mobile").val(),
                "clientAddress": $("#client-address").val(),
                "clientLocation": $("#client-location").val(),
                "clientPincode": $("#client-pincode").val(),
                "clientCity": $("#client-city").val(),
                "clientProfession": $("#client-profession").val(),
                "clientLocality": $("#client-locality").val(),
                "clientSource": $("#client-source").val(),
                "projectName": $("#project-name").val(),
                "projectComponent": $("input[name='projectComponent']:checked").val(),
                "remarks": $("#EnquiryFormRemarks").val(),
                "date": new Date()
            }),
            success: function (result) {
                console.log(result);
                $("#EnquiryFormMessages").text(result["usermessage"]).addClass("success").removeClass("error");
                setTimeout(function () {
                    $('#EnquiryCreationModal').modal('hide');
                }, 3000);
                loadEnquiries();
            },
            error: function (xhr, status, error) {
                console.table(xhr, status, error);
                var errorMessage = JSON.parse(xhr.responseText).error;
                $("#EnquiryFormMessages").text(errorMessage).addClass("error").removeClass("success");
            }
        });
    });

    $("#siteVistComletedButton").on("click", function () {
        console.log($("#SiteVisitRemarks").val());
        $.ajax({
            url: "http://localhost:8082/propertystudio/addSiteVisit",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                "enquiry": {
                    "id": $("#enquiryId").val()
                },
                "remarks": $("#SiteVisitRemarks").val(),
                "status": $("#status").val(),
                "date": new Date(),
            }),
            success: function (result) {
                console.log(result);
                $("#SiteVisitMessages").text(result["usermessage"]).addClass("success").removeClass("error");
                setTimeout(function () {
                    // Your action here
                    $('#SiteVisitModal').modal('hide');
                }, 5000);
            },
            error: function (xhr, status, error) {
                console.table(xhr, status, error);
                var errorMessage = JSON.parse(xhr.responseText).error;
                $("#SiteVisitMessages").text(errorMessage).addClass("error").removeClass("success");
            }
        })
    });

    $("#excelDownloadButton").on("click",function(){
        $.ajax({
            url: 'http://localhost:8082/propertystudio/allEnquiries',
            method: 'GET',
            dataType: 'json',
            success: function (enquiryJsonData) {
                downloadExcelFromJson(enquiryJsonData);
            },
            error: function (xhr, status, error) {
                alert("error in downloading !")
                console.error(xhr, status, error);
            }
        });
    });
});

