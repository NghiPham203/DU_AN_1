<?php
    include_once 'model/m_pdo.php';

    function page_productNew(){
        return pdo_query("SELECT * FROM sanpham WHERE New = 1 ORDER BY MaSP DESC"); //Vì là sanphammoi nên cái sp nào mới thêm thì nó tự xếp lên đầu tiên, or mình muốn cố định thì dùng NEW
    }

    function page_productDiscount(){
        return pdo_query("SELECT * FROM sanpham WHERE Discount > 0 ORDER BY Discount DESC");
    }

    function page_productLuotMua(){
        return pdo_query("SELECT * FROM sanpham WHERE LuotMua > 0 ORDER BY LuotMua DESC");
    }

    function page_productLuotXem(){
        return pdo_query("SELECT * FROM sanpham WHERE LuotXem > 0 ORDER BY LuotXem DESC");
    }
?>