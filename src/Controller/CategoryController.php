<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use Doctrine\ORM\EntityManager;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CategoryController extends AbstractController
{
    #[Route('/category', name: 'app_category')]
    public function index(CategoryRepository $categoryRepository): Response
    {
        $categories = $categoryRepository->findBy([], ["categoryName" => "ASC"]);
        return $this->render('category/index.html.twig', [
            'categories' => $categories
        
        ]);
    }

    #[Route('/category/new', name: 'new_category')]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $category = new Category();

        $form = $this->createForm(CategoryType::class, $category);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $category = $form->getData();
            $entityManager->persist($category);
            $entityManager->flush();

            return $this->redirectToRoute('app_category');
        }


        return $this->render('category/new.html.twig', [
            'formAddCategory' => $form,
        ]);
    }

    #[Route('/category/{id}', name: 'show_category')]
    public function show(Category $category): Response 
    {
        return $this->render('category/show.html.twig', [
            'category' => $category
        ]);
    }
}
