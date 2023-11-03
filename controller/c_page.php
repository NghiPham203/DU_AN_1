<?php
    include_once 'config.php';
    include_once 'model/m_page.php';

    if(isset($_GET['act']) && ($_GET['act']!="")){
        switch ($_GET['act']) {
            case 'home':
                $getdanhmuc = danhmuc_getAll();
                $getproNew = page_productNew();
                $getDiscount = page_productDiscount();
                $getLuotMua = page_productLuotMua();
                $getLuotXem = page_productLuotXem();
                $view_name = "page_home";
                break;
            
            default:
                header("location:index.php?mod=page&act=home");
                break;
        }
        include_once 'view/v_user_layout.php';
    }else{
        header("location:index.php?mod=page&act=home");
    }
?>