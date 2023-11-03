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

    function showsp_home($dssp){
        $page_home = "";
        foreach($dssp as $item){

            if($item['GiaSP'] >=1){
                $price = '<h5>'.$item['GiaSP'].' VNĐ</h5>';
            }else{
                $price = "<h5>Đang cập nhật</h5>";
            }

            if($item['Discount'] >= 1){
                $GiamGia = '<div class="product__discount__percent_home">'.$item['Discount'].'</div>';
            }else{
                $GiamGia = "";
            }

            echo '<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                <div clas)s="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="view/img/featured/'.$item['HinhAnh'].'">
                        '.$GiamGia.'
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">'.$item['TenSP'].'</a></h6>
                        '.$price.'
                    </div>
                </div>
            </div>';
            
        }

        return $page_home;
    }

    function showsp_home_luotmua($dssp){
        $page_home = "";
        foreach($dssp as $item){

            if($item['GiaSP'] >=1){
                $price = '<h5>'.$item['GiaSP'].' VNĐ</h5>';
            }else{
                $price = "<h5>Đang cập nhật</h5>";
            }

            if($item['Discount'] >= 1){
                $GiamGia = '<div class="product__discount__percent_home">'.$item['Discount'].'</div>';
            }else{
                $GiamGia = "";
            }

            if($item['LuotMua']){
                $MuaHang = '<h6>Số lượt mua<strong>('.$item['LuotMua'].')</strong></h6>';
            }else{
                $MuaHang = '';
            }

            

            
            echo '<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                <div clas)s="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="view/img/featured/'.$item['HinhAnh'].'">
                        '.$GiamGia.'
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">'.$item['TenSP'].'</a></h6>
                        '.$price.'
                        <div class="featured__item__text_MX">'.$MuaHang.'</div>
                    </div>
                </div>
            </div>';
            
        }

        return $page_home;
    }

    function showsp_home_luotxem($dssp){
        $page_home = "";
        foreach($dssp as $item){

            if($item['GiaSP'] >=1){
                $price = '<h5>'.$item['GiaSP'].' VNĐ</h5>';
            }else{
                $price = "<h5>Đang cập nhật</h5>";
            }

            if($item['Discount'] >= 1){
                $GiamGia = '<div class="product__discount__percent_home">'.$item['Discount'].'</div>';
            }else{
                $GiamGia = "";
            }

            if($item['LuotXem']){
                $SoView = '<h6> <strong>('.$item['LuotMua'].')</strong> Lượt xem</h6>';
            }else{
                $SoView = '';
            }


            

            
            echo '<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                <div clas)s="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="view/img/featured/'.$item['HinhAnh'].'">
                        '.$GiamGia.'
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">'.$item['TenSP'].'</a></h6>
                        '.$price.'
                        <div class="featured__item__text_MX">'.$SoView.'</div>
                    </div>
                </div>
            </div>';
            
        }

        return $page_home;
    }
?>