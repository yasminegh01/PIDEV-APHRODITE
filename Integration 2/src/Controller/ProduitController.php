<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Entity\Promotion;
use App\Form\ProduitType;
use App\Repository\ProduitRepository;
use Container0uSdjsb\getProduitService;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Dotenv\Exception\FormatException;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\SerializerInterface;
use Dompdf\Options;
use Dompdf\Dompdf;

//yas


#[Route('/produit')]
class ProduitController extends AbstractController
{

    #[Route('/', name: 'app_produit_liste', methods: ['GET'])]
    public function index(ProduitRepository $produitRepository): Response
    {
        // dd($produitRepository->findAll();
        return $this->render('admin/produit/tableProduit.html.twig', [
            'produits' => $produitRepository->findAll(),
        ]);
    }
    #[Route('/triMed', name: 'app_produit_triMed', methods: ['GET'])]
    public function triMed(ProduitRepository $produitRepository,PaginatorInterface $paginator ,Request $request): Response
    {
        $produits = $produitRepository->findByCategorie ("medicament bio");
        $produits = $paginator->paginate(
            $produits, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            2 /*limit per page*/
        );
        // dd($produitRepository->findAll();
        return $this->render('produit/produit.html.twig', [
            'produits' => $produits ,
        ]);
    }
    #[Route('/triVit', name: 'app_produit_triVit', methods: ['GET'])]
    public function triVit(ProduitRepository $produitRepository,PaginatorInterface $paginator ,Request $request): Response
    {
        $produits = $produitRepository->findByCategorie ("vitamins");
        $produits = $paginator->paginate(
            $produits, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            2 /*limit per page*/
        );
        // dd($produitRepository->findAll();
        return $this->render('produit/produit.html.twig', [
            'produits' => $produits ,
        ]);
    }
    #[Route('/triVet', name: 'app_produit_triVet', methods: ['GET'])]
    public function triVet(ProduitRepository $produitRepository,PaginatorInterface $paginator ,Request $request): Response
    {
        $produits = $produitRepository->findByCategorie ("vetements");
        $produits = $paginator->paginate(
            $produits, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            2 /*limit per page*/
        );
        // dd($produitRepository->findAll();
        return $this->render('produit/produit.html.twig', [
            'produits' => $produits ,
        ]);
    }

    
    #[Route('/listp', name: 'produit_list', methods: ['GET'])]
public function listp(ProduitRepository $produitRepository): Response
{
    $options = new Options();
    $options->set('defaultFont','Courier');
    $dopmdf=new Dompdf();
    $produits = $produitRepository->findAll();
    $html=$this->renderView('produit/listp.html.twig', ['produits' => $produits,]);
    $dopmdf->loadHtml($html);
    $dopmdf->setPaper('A4','landscape');
    $dopmdf->render();
    $pfdcontent=$dopmdf->output();
    $response= new Response();
    $response->headers->set('Content-Type','application/pdf');
    $response->setContent($pfdcontent);

    return $response;
}
    #[Route('/p', name: 'app_produit', methods: ['GET'])]
    public function produit(ProduitRepository $produitRepository ,PaginatorInterface $paginator ,Request $request): Response
    {
        $produits=$produitRepository->findAll();
        $produits = $paginator->paginate(
            $produits, /* query NOT result */
            $request->query->getInt('page', 1), /*page number*/
            2 /*limit per page*/
        );
        return $this->render('produit/produit.html.twig', [
            'produits' => $produits,
        ]);
    }

    #[Route('/new', name: 'app_produit_new', methods: ['GET', 'POST'])]
    public function new(Request $request, ProduitRepository $produitRepository): Response
    {
        $produit = new Produit();
        $form = $this->createForm(ProduitType::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $produitRepository->save($produit, true);

            return $this->redirectToRoute('app_produit_liste', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/produit/newProduit.html.twig', [
            'produit' => $produit,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_produit_show', methods: ['GET'])]
    public function show(Produit $produit): Response
    {
        return $this->render('produit/show.html.twig', [
            'produit' => $produit,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_produit_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Produit $produit, ProduitRepository $produitRepository): Response
    {
        $form = $this->createForm(ProduitType::class, $produit);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $produitRepository->save($produit, true);

            return $this->redirectToRoute('app_produit_liste', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('admin/produit/newProduit.html.twig', [
            'produit' => $produit,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_produit_delete', methods: ['POST'])]
    public function delete(Request $request, Produit $produit, ProduitRepository $produitRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$produit->getId(), $request->request->get('_token'))) {
            $produitRepository->remove($produit, true);
        }

        return $this->redirectToRoute('app_produit_liste', [], Response::HTTP_SEE_OTHER);
    }

    //pdf
    /*
    #[Route('/pdf/{id}', name: 'produit.pdf')]
    public function generatePdfProduit(produit $produit = null, Pdfservice $pdf) {
        $html = $this->render('produit/produit.html.twig', ['produit' => $produit]);
        $pdf->showPdfFile($html);
    }*/
//PDF

// #[Route('/listp', name: 'produit_list', methods: ['GET'])]
// public function listp(ProduitRepository $produitRepository): Response
// {
// $produits = $produitRepository->findAll();
// return $this->render('produit/listp.html.twig', ['produits' => $produits,]);
// }
    /*

#[Route('/getAll', name: 'app_produit_JSON')]
public function getallproduit(ProduitRepository $produitRepository , SerializerInterface $serializerInterface)
{
$produits = $produitRepository->findAll();
$json = $serializerInterface->serialize($produits,'json',['groups'=>'produit']);
dump($json);
die;

}



//affichage avec json

#[Route('/getAll', name: 'app_produit_JSON' )]

public function getAllprod( ProduitRepository $produitRepository , SerializerInterface $serializer)
{
$produits = $produitRepository->findAll();

$json = $serializer->serialize($produits,'json',['groups'=>'produit']);

dump($json);
die;

}








//json ajout



#[Route('/addprod', name: 'app_produit_new_JSON', methods: ['GET','POST'])]


public function newprod(Request $request, ProduitRepository $produitRepository): JsonResponse

    
{
    $produit = new Produit();

        $nom = $request->get('nom');
        $quantite = $request->get('quantite');
        $prix = $request->get('prix');
        $categorie = $request->get('categorie');
        $description = $request->get('description');
        $promo = $request->get('promo');
        $image = $request->get('image');



        $produit->setNom($nom);
        $produit->setQuantite($quantite);
        $produit->setPrix($prix);
        $produit->setCategorie($categorie);
        $produit->setDescription($description);
        $produit->setPromo($promo);
        $produit->setImage($image);

        $produitRepository->save($produit,true);

        $serializer = new Serializer([new ObjectNormalizer()]);
        $formatted = $serializer->normalize($produit);
        return new JsonResponse($formatted);
    }




#[Route('/editt', name: 'app_produit_edit_json', methods: ['GET'])]

public function modifierprod(Request $request,ProduitRepository $produitRepository): JsonResponse
{
    $produit = $produitRepository->find($request->get('id'));

    if (!$produit) {
        $formatted = ['error' => 'produit not found.'];
        return new JsonResponse($formatted);
    }
}





#[Route('/JSON/delete', name: 'app_produit_delete', methods: ['GET'])]

public function deleteprod (Request $request, ProduitRepository $produitRepository) {
$id = $request->get(key: "id");
$produit = $produitRepository->find($id);
if($produit != null) {

$produitRepository->remove($produit);
$serializer = new Serializer ([new ObjectNormalizer()]);
$formatted = $serializer->normalize( data: "produit has been deleted successfully.");
return new JsonResponse($formatted);

$formatted =["error" => "Invalid produit ID."];
return new JsonResponse($formatted);
}
}






//autre methode
    #[Route('/displayproduit', name: 'app_produit_display', methods: ['GET', 'POST'])]

    public function displayProduitMobile(Request $request, SerializerInterface $serializer, EntityManagerInterface $entityManager): Response
    {
        $produits = $entityManager->getRepository(Produit::class)->findAll();
        $formatted = $serializer->normalize($produits,'json',['groups' => 'produit']);
        return new Response(json_encode($formatted));
    }
    */

    /*achraf
    #[Route('/displayProd', methods: ['GET'], name: 'display_prod')]
    public function displayProd(EntityManagerInterface $entityManager,SerializerInterface $serializer)
    {
        // $posts = $entityManager
        //     ->getRepository(Post::class)
        //     ->findAll();

        $produits = $entityManager
            ->getRepository(produit::class)
            ->createQueryBuilder('p')
            ->orderby('p.id')
            ->select('p.id,p.title,p.slug,p.summary,p.content,p.publishedAt')
            ->getQuery()
            ->getResult();
        $json = $serializer->serialize($produits, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['normal']]);


        //$serializer = new Serializer([new ObjectNormalizer()]);
        return new JsonResponse(json_decode($json));
        // return new JsonResponse($formatted, 200, [], JSON_UNESCAPED_UNICODE);
        // return new JsonResponse($formatted);

    }

    #[Route('/newProd', name: 'app_produit_prod', methods: ['GET', 'POST'])]
    public function NewProd(Request $request,ProduitRepository $produitRepository,EntityManagerInterface $entityManager,SerializerInterface $serializer): JsonResponse
    {
        $Produit = new Produit();



        $nom = $request->get('nom');
        $quantite = $request->get('quantite');
        $prix = $request->get('prix');
        $categorie = $request->get('categorie');
        $description = $request->get('description');
        $promo = $request->get('promo');
        $image = $request->get('image');


        $Produit->setNom($nom);
        $Produit->setQuantite($quantite);
        $Produit->setPrix($prix);
        $Produit->setCategorie($categorie);
        $Produit->setDescription($description);
        $Produit->setPromo($promo);
        $Produit->setImage($image);

        $produitRepository->save($Produit,true);

        $json = $serializer->serialize($Produit, 'json');
        $formatted = $serializer->serialize($json, 'json', ['groups' => ['produit']]);
        $formatted = $serializer->normalize($Produit);
        return new JsonResponse($formatted);
}


    #[Route('/addprod', name: 'app_produit_new_JSON', methods: ['POST'])]


    public function newprod(Request $request, ProduitRepository $produitRepository): JsonResponse


    {
        $produit = new Produit();

        $nom = $request->get('nom');
        $quantite = $request->get('quantite');
        $prix = $request->get('prix');
        $categorie = $request->get('categorie');
        $description = $request->get('description');
        $promo = $request->get('promo');
        $image = $request->get('image');



        $produit->setNom($nom);
        $produit->setQuantite($quantite);
        $produit->setPrix($prix);
        $produit->setCategorie($categorie);
        $produit->setDescription($description);
        $produit->setPromo($promo);
        $produit->setImage($image);

        $produitRepository->save($produit,true);

        $serializer = new Serializer([new ObjectNormalizer()]);
        $formatted = $serializer->normalize($produit);
        return new JsonResponse($formatted);
    }

*/

    // ************** affichage JSON
    #[Route('/JSON/getAll', name: 'app_produit_JSON', methods: ['GET'])]
    public function getAllProd(SerializerInterface $serializer, ProduitRepository $produitRepository)
    {
        $produits = $produitRepository->findAll();
        $json = $serializer->serialize($produits, 'json', [
            AbstractNormalizer::IGNORED_ATTRIBUTES => ['promo'],
        ]);

        return new JsonResponse($json, 200, [], true);
    }


    // ******************************    ajout JSON
    #[Route('/JSON/new', name: 'app_produit_new_JSON', methods: ['GET', 'POST'])]
    public function ajouterProduit(Request $request,ProduitRepository $produitRepository,EntityManagerInterface $entityManager): JsonResponse
    {
        $produit = new Produit();


        $nom = $request->get('nom');
        $quantite = $request->get('quantite');
        $prix = $request->get('prix');
        $categorie = $request->get('categorie');
        $description = $request->get('description');
        $image = $request->get('image');
        $promo = $request->get('promo');
        $promo = $entityManager->getRepository(Promotion::class)->find($promo);


        $produit->setNom($nom);
        $produit->setQuantite($quantite);
        $produit->setPrix($prix);
        $produit->setCategorie($categorie);
        $produit->setDescription($description);
        $produit->setImage($image);
         $produit->setPromo($promo);
        $produitRepository->save($produit,true);

        $serializer = new Serializer([new ObjectNormalizer()]);
        $formatted = $serializer->normalize($produit);
        return new JsonResponse($formatted);
    }

    // ****************** JSON supprimer
    #[Route('/JSON/delete', name: 'app_produit_delete', methods: ['GET'])]
    public function deleteproduitAction(Request $request , ProduitRepository $produitRepository) {
        $id = $request->get('id');

        $produit = $produitRepository->find($id);

        if($produit != null) {
            $produitRepository->remove($produit,true);

            $serializer = new Serializer([new ObjectNormalizer()]);
            $formatted = $serializer->normalize("produit has been deleted successfully.");
            return new JsonResponse($formatted);
        }

        $formatted = ["error" => "Invalid produit ID."];
        return new JsonResponse($formatted);
    }

    // *********** modifier JSON
    #[Route('/JSON/jsonedit', name: 'app_produit_edit_json', methods: ['GET'])]
    public function modifierproduitAction(Request $request,ProduitRepository $produitRepository): JsonResponse
    {
        $produit = $produitRepository->find($request->get('id'));

        if (!$produit) {
            $formatted = ['error' => 'produit not found.'];
            return new JsonResponse($formatted);
        }

        $nom = $request->get('nom');
        $quantite = $request->get('quantite');
        $prix = $request->get('prix');
        $categorie = $request->get('categorie');
        $description = $request->get('description');
        $image = $request->get('image');
        $promo=$request->get('promo');

        $produit->setNom($nom);
        $produit->setQuantite($quantite);
        $produit->setPrix($prix);
        $produit->setCategorie($categorie);
        $produit->setDescription($description);
        $produit->setImage($image);
        $produit->setPromo($promo);

        $produitRepository->save($produit,true);

        $serializer = new Serializer([new ObjectNormalizer()]);
        $formatted = $serializer->normalize($produit);

        return new JsonResponse($formatted);
    }

}

