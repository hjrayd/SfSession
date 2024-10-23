<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CategoryController extends AbstractController
{
    #[Route('/category', name: 'app_category')]
    public function index(CategoryRepository $categoryRepository): Response
    {
        $categories = $categoriesRepository->findBy([], ["categoryName" => "ASC"]);
        return $this->render('category/index.html.twig', [
            'categories' => $categorie
        
        ]);
    }

    #[Route('/category/new', name: 'new_category')]
    public function new(Request $request): Response
    {
        $category = new Category();

        $form = $this->createForm(CategoryType::class, $category);

        return $this->render('category/new.html.twig', [
            'formAddCategory' => $form,
        ]);
    }
}
