<?php

namespace App\Plugins\Certificate\Http\Controllers;

use App\Course;
use App\Http\Controllers\Controller;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Support\Facades\Auth;
use PDF;


class CertificateController extends Controller{
    private $layouts_path;
    private $layouts_url;
    private $layout;
    private $layout_url;
    private $plugin_url;
    private $debug = false;
    private $user;
    private $course;

    public function __construct(){
        parent::__construct();

        $this->layouts_path = root_path('Plugins/CertificateAssets/layouts/');
        $this->layouts_url = asset("Plugins/CertificateAssets/layouts/");
        $this->plugin_url = asset("Plugins/CertificateAssets");

        $this->layout = 'default';

        $this->debug = true;

        $this->layouts_url = asset("Plugins/CertificateAssets/layouts/".$this->layout);
    }

    public function generateCertificate($course_id){
        if ( ! Auth::check()){
            abort(404);
        }

        $this->user = Auth::user();
		
		$isCourseComplete = $this->user->is_completed_course($course_id);
        if ( ! $isCourseComplete){
            abort(404);
        }
        $this->course = Course::find($course_id);
        if ( ! $this->course){
            abort(404, 'Course Not Found');
        }
		
		$autoload_url = app_path('Plugins/Certificate/vendor/autoload.php');
        require_once $autoload_url;
		
		$signature_src = null;
        $certificate_path = $this->layouts_path.$this->layout;
		$signature_id = get_option('certificate.signature_id');
		if($signature_id)
			$signature_src = media_image_uri($signature_id)->original;
		$authorise_name = get_option('certificate.authorise_name');
		$company_name = get_option('certificate.company_name');;
		
		$data = array();
		$data['layouts_url'] = $this->layouts_url;
		$data['signature_src'] = $signature_src;
		$data['authorise_name'] = $authorise_name;
		$data['company_name'] = $company_name;
		
		$pdf = PDF::loadView('testpdf', $data,[],
			[
				'orientation'=>'L',
				'default_font'=>'chelveticai'
			]
		);
		
		
		//$pdf->SetWatermarkImage('https://www.mvshospital.com/wp-content/uploads/2015/01/blue-bg.jpg', 1.0);   
		$pdf->showWatermarkImage = true;
		//$pdf->SetDefaultBodyCSS('background', "url('https://www.mvshospital.com/wp-content/uploads/2015/01/blue-bg.jpg')");




		$pdfContent = $pdf->Output('', "S");
		return response($pdfContent, 200,
        [
            'Content-Type'        => 'application/pdf',
            'Content-Length'      =>  strlen($pdfContent),
            'Content-Disposition' => 'attachment; filename="mypdf.pdf"',
            'Cache-Control'       => 'private, max-age=0, must-revalidate',
            'Pragma'              => 'public'
        ]
		);
        
        /*$isCourseComplete = $this->user->is_completed_course($course_id);
        if ( ! $isCourseComplete){
            abort(404);
        }
        $this->course = Course::find($course_id);
        if ( ! $this->course){
            abort(404, 'Course Not Found');
        }

        // include autoloader
        $autoload_url = app_path('Plugins/Certificate/vendor/autoload.php');
        require_once $autoload_url;

        $options =  new Options( apply_filters( 'certificate_dompdf_options', array(
            'defaultFont'				=> 'sans',
            'isRemoteEnabled'			=> true,
            'isFontSubsettingEnabled'	=> true,
            // HTML5 parser requires iconv
            'isHtml5ParserEnabled'		=> extension_loaded('iconv') ? true : false,
        ) ) );

        $dompdf = new Dompdf($options);

        $dompdf->loadHtml($this->content());
        $dompdf->setPaper('A4', 'landscape');
        $dompdf->render();

        if ($this->debug){
            $dompdf->stream("certificate.pdf", array("Attachment" => false));
            exit(0);
        }
        $dompdf->stream("certificate.pdf");*/
    }


    public function content(){
        $certificate_path = $this->layouts_path.$this->layout;

        ob_start();
        include $certificate_path.'/certificate.php';
        $content = ob_get_clean();

        return $content;
    }


    public function certificateSettings(){
        $title = "Certificate Settings";
        return view('plugin:certificate::certificate_settings', compact('title'));
    }

}
