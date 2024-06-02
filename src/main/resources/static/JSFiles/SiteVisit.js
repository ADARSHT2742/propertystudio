$(document).ready(function () {

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

    function createSiteVisitTile(siteVisit) {
        const $siteVisitTile = $('<div></div>').addClass('siteVisitTile row w-100');

        // Photo container
        const $photo = $('<div></div>').addClass('photo col-md-2').append(
            $('<img>').attr('src', 'https://cdni.iconscout.com/illustration/premium/thumb/couple-visiting-construction-site-for-checking-work-progress-2079349-1757215.png').attr('alt', 'Customer Photo')
        );
        $siteVisitTile.append($photo);

        // Details container
        const $detailsContainer = $('<div></div>').addClass('details col-md-3');
        const $nameDetail = $('<p></p>').append($('<strong></strong>').text('Name: ')).append(document.createTextNode(siteVisit.enquiry.clientName));
        const $emailDetail = $('<p></p>').append($('<strong></strong>').text('Email: ')).append(document.createTextNode(siteVisit.enquiry.clientEmail));
        const $mobileDetail = $('<p></p>').append($('<strong></strong>').text('Mobile: ')).append(document.createTextNode(siteVisit.enquiry.clientMobile));

        $detailsContainer.append($nameDetail, $emailDetail, $mobileDetail);
        $siteVisitTile.append($detailsContainer);

        // Project container
        const $projectContainer = $('<div></div>').addClass('project col-md-3');
        const $projectDetail = $('<p></p>').append($('<strong></strong>').text('Project: ')).append(document.createTextNode(siteVisit.enquiry.projectName));
        const $componentDetail = $('<p></p>').append($('<strong></strong>').text('Component: ')).append(document.createTextNode(siteVisit.enquiry.projectComponent));

        $projectContainer.append($projectDetail, $componentDetail);
        $siteVisitTile.append($projectContainer);

        // Other details container
        const $otherDetailsContainer = $('<div></div>').addClass('buttons col-md-4');
        const $enquiryDateDetail = $('<p></p>').append($('<strong></strong>').text('Enquiry Date: ')).append(document.createTextNode(new Date(siteVisit.enquiry.date).toLocaleString()));
        const $siteVisitDateDetail = $('<p></p>').append($('<strong></strong>').text('Site Visit Date: ')).append(document.createTextNode(new Date(siteVisit.date).toLocaleString()));
        const $siteVisitStatus = $('<p></p>').append($('<strong></strong>').text('Status: ')).append(document.createTextNode(siteVisit.status));

        $otherDetailsContainer.append($enquiryDateDetail, $siteVisitDateDetail, $siteVisitStatus);
        $siteVisitTile.append($otherDetailsContainer);

        return $siteVisitTile;
    }

    function loadSiteVisits() {
		console.log("skndasdf");
        $.ajax({
            url: 'http://localhost:8082/propertystudio/allSiteVisits',
            method: 'GET',
            dataType: 'json',
            success: function (response) {
				console.log(response);
                const sitevisits = response;
                const siteVisitsContainer = $('#siteVisitsContainer');
                siteVisitsContainer.empty();
                if (sitevisits.length === 0) {
                    siteVisitsContainer.text("No Site Visits on your account yet, Hurry Up & Generate from your enquiries !").addClass("text-center mt-3");
                } else {
                    sitevisits.forEach(function (sitevisit) {
                        const siteVisitTile = createSiteVisitTile(sitevisit);
                        siteVisitsContainer.append(siteVisitTile);
                    });
                }
            },
            error: function (xhr, status, error) {
                const siteVisitsContainer = $('#siteVisitsContainer');
                siteVisitsContainer.text("No Site Visits on your account yet, Hurry Up & Generate from your enquiries !").addClass("text-center mt-3");
                console.error(xhr, status, error);
            }
        });
    }

    loadSiteVisits();

    $("#excelDownloadButton").on("click", function () {
        $.ajax({
            url: 'http://localhost:8082/propertystudio/allSiteVisits',
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