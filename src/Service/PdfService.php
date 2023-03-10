<?php

namespace App\Service;
use Options;
use Dompdf\Dompdf;

class PdfService
{
    private $domPdf;


    public function __construct()
    {
        $this->domPdf = new Dompdf();

        $pdfOptions = new \Dompdf\Options();

        $pdfOptions->set('defaultFont', 'Aphrodite');

        $this->domPdf->setOptions($pdfOptions);
    }


    public function showPdfFile($html)
    {
        $this->domPdf->loadHtml($html
        );
        $this->domPdf->render();
        $this->domPdf->stream("details.pdf", [
            'Attachement' => false
        ]);

// (Optional) Setup the paper size and orientation
        $this->domPdf->setPaper('A4', 'landscape');



    }

    public function generateBinaryPDF($html)
    {
        $this->domPdf->loadHtml($html);
        $this->domPdf->render();
        $this->domPdf->output();
    }
}
