<?php
    include_once 'model/m_pdo.php';

    function danhmuc_getAll(){
        return pdo_query("SELECT * FROM danhmuc ORDER BY MaDM DESC");
    }
?>