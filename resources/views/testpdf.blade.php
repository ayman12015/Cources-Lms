
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Ahmed's Certificate</title>
</head>
<body style="font-family: chelveticai;background-size:cover;background-repeat:no-repeat;background: url(<?php echo $layouts_url?>/certificate.png)">

<div class="certificate-wrap">

    <div align="center" class="certificate-content">
        <h1 style="padding-top:200px;font-size:55px;" cellSpacing="10" align="center" cellPadding="10">شهادة إكمال</h1>

        <p style="font-size:28px;" cellSpacing="50" align="center">This is to Certify that <span class="students_name"> أحمد</span>  </p>

        <p style="font-size:28px;" align="center"> Successfully completed <strong>اسم الدورة</strong> </p>
        <p align="center" class="course-name"></p>
    </div>


    <div class="signature-wrap">
        <?php if ($signature_src){
            ?>
            <div class="signature-image-wrap">
                <img src="<?php echo $signature_src; ?>" />
            </div>
        <?php } ?>

        <div class="signature-text">

            <p> <?php echo $authorise_name;?> </p>
            <p> <strong><?php echo $company_name; ?></strong> </p>
        </div>
		
        <div style="clear: both"></div>
    </div>

</div>



</body>
</html>


