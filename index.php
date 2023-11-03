<?php
    include_once 'config.php';
    include_once 'model/m_catagory.php';
    $getdanhmuc = danhmuc_getAll();
    if(isset($_GET['mod']) && ($_GET['mod']!="")){
        switch ($_GET['mod']) {
            case 'page':
                $controller_name = 'page';
                break;
            case 'product':
                $controller_name = 'product';
                break;
            default:
                header("location:index.php?mod=page&act=home");
                break;
        }
        include_once 'controller/c_'.$controller_name.'.php';
    }else{
        header("location:index.php?mod=page&act=home");
    }
  
?>
