<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <title>test</title>
        <%@include file="../components/common_css_js.jsp" %>

        <style>
            :root {
                --background-color1:rgb(240,236,236);
                --background-color2:rgb(221,217,217);
                --primary-color: rgb(64,11,199);
                --secondary-color: rgb(39,4,125);
            }
            *{

                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body{

                max-height: 100%;
                background-color: var(--background-color2);
                overflow-x: hidden;
            }
            /* start navabr*/

            header{
                width: 100vw;
                height:70px;
                display: flex;
                padding: 0 20px;
                justify-content: space-around;
                background-color: var(--background-color1);
                box-shadow: 1px 1px 10px rgb(188,187,187,0.6);
                align-items: center;
                position: fixed;
                top:0;
                left:0;
            }

            header .logo,
            header .search-area,
            header .notification{
                display:flex;
                align-items: center;

            }

            .logo{
                gap:30px;
            }


            .brand-name{

                font-size: 22px;
                font-weight: 600;
                cursor: pointer;
                color:var(--secondary-color);

            }
            .logo-icon{
                font-size: 25px;

            }
            .search-input{
                width:200px;
                height: 40px;
                border-radius: 45px 0 0 45px;
                background-color: var(--background-color2);
                border: none;
                outline: none;
                padding: 0 18px;
                font-size: 15px;
            }
            .search-btn{
                width: 50px;
                height:40px;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: var(--primary-color);
                border-radius: 0 45px 45px 0;
                cursor: pointer;
                border: none;
                outline: none;
            }
            .search-btn-icon{
                color: white;
                font-size: 20px;
            }

            .notification{
                gap:30px;
            }
            .notification .fa-bell,
            .notification .fa-user-circle-o{
                font-size: 25px;
                cursor: pointer;
            }
            /*end navabr*/

            /*start dashboard*/

            .main-container{
                width:100vw;
                position: relative;
                display:flex;
                top:70px;
                height: calc(100vh - 70px)

            }
            .nav-container{
                height: calc(100vh -70px);
                width: 250px;
                box-shadow: 1px 1px 10px rgba(189,180,185,0.7);
                overflow-x: hidden;
                overflow-y: scroll;
                position: relative;
            }
            .nav-container::-webkit-scrollbar {
                display: none;
            }

            .nav{

                display:flex;
                flex-direction: column;
                width:250px;
                min-height: 91vh;
                background-color: var(--background-color1);
                position: absolute;
                top:0;
                left:0;
                padding: 30px 0 20px 10px;
                justify-content: space-between;
                overflow: none;
            }

            .nav-option{
                display: flex;
                align-items: center;
                width: 250px;
                height: 60px;
                padding: 0 30px 0 20px;
                gap:20px;
                cursor: pointer;
            }

            .nav-option:not(:first-child) i.fa{
                font-size:20px;
                color: var(--primary-color);
            }

            .nav-option:first-child i.fa{
                color: white;
            }



            .nav-option h3{

                font-size: 20px;

            }

            .nav-option:first-child h3{
                color:white;
                font-size: 22px;
            }

            .option1{

                background-color: var(--secondary-color);
            }

            .nav-option:hover:not(:first-child){
                background-color: var(--background-color2);
                border-left: 2px solid var(--secondary-color);
            }

            /*main part*/

            .main{
                width:100%;
                height: calc(100vh -70vh);
                padding: 40px 30px 30px 30px;
                overflow-y: scroll;
                overflow-x: hidden;
            }

            /*for customized scroll bar*/

            .main::-webkit-scrollbar-thumb{
                background-image: linear-gradient(to bottom,rgb(0,0,85),rbg(0,0,50));

            }
            .main::-webkit-scrollbar{
                width: 5px;
            }
            .main::-webkit-scrollbar-track{
                background-color: #9e9e9eb2;
            }

            .box-container{
                display:flex;
                justify-content: space-evenly;
                align-items: center;
                gap:50px;
                flex-wrap: wrap;
            }
            .box{
                height: 130px;
                width: 230px;
                border-radius: 20px;
                box-shadow: 3px 3px 10px rgba(0,30,90,0.7);
                padding: 20px;
                display: flex;
                align-items: center;
                justify-content: space-around;
                cursor: pointer;
                transition: transform 0.3s ease-in-out;

            }

            .box:hover{

                transform: scale(1.08);
            }
            .box:nth-child(1){
                background-color: var(--secondary-color);
            }
            /*            .box:nth-child(2){
                            background-color: var(--secondary-color);
                        }
                        .box:nth-child(3){
                            background-color: var(--primary-color);
                        }
                        .box:nth-child(4){
                            background-color: var(--secondary-color);
                        }*/

            .box .text{
                color: white;
            }

            .box i.fa{
                font-size: 30px;
                color: white;

            }

            /*report*/

            .report-container{
                min-height: 300px;
                max-width: 1100px;
                margin: 50px auto 0px auto;
                background-color: white;
                border-radius: 30px;
                box-shadow: 3px 3px 10px rgba(188,188,188,0.9);
                padding: 0px 20px 20px 20px;
            }


            .report-header{
                height: 80px;
                width:100%;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 20px 20px 10px 20px;
                border-bottom: 2px solid rgba(0,20,151,0.60);
            }

            .recent-article{
                font-size: 30px;
                font-weight: 600;
                color: #5500cb;
            }

            .view{
                height: 35px;
                width:90px;
                border-radius: 8px;
                background-color: #5500cb;
                color: white;
                font-size: 15px;
                border:none;
                cursor: pointer;
            }

            .report-body{
                max-width: 1160px;
                overflow-x: auto;
                padding: 20px;
            }

            .report-topic-heading, .item1{

                width:1120px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .items{
                width:1120px;
                margin-top: 15px;

            }

            .t-op{
                font-size: 18px;
                letter-spacing: 0px;
            }

            .item1{
                margin-top:20px;
            }

            .t-op-nextlvl{
                font-size: 14px;
                letter-spacing: 0px;
                font-weight: 600;
            }

            .lavel-tag{
                width: 100px;
                text-align: center;
                background-color: rgb(0,180,0);
                color: white;
                border-radius: 4px;
            }



            /*responsive css*/
            @media screen and (max-width:768px){

                .nav-container{
                    display: none;
                }

                .navclose{
                    display: block;
                    position: absolute;
                    top:0;
                    bottom: 0;
                    left:0;

                }

                .brand-name{
                    display: none;
                }

                .search-input{
                    width: 150px;
                    border:1px solid rgb(31,42,197);
                    border-radius: 45px 45px 45px 45px;
                }

                .search-btn{
                    display: none;
                }

            }



        </style>

    </head>
    <body>
        <header>
            <div class="logo">
                <span class="brand-name">apple</span>
                <i class="fa fa-bars  logo-icon "></i>
            </div>
            <div class="search-area">
                <input type="text" name="search" class="search-input"/>
                <button class="search-btn"><i class="fa fa-search search-btn-icon"></i></button>
            </div>
            <div class="notification">
                <div class="red-circle"></div>
                <i class="fa fa-bell"></i>
                <i class="fa fa-user-circle-o"></i>
            </div>
        </header>

        <div class="main-container">
            <div class="nav-container">
                <div class="nav">
                    <div class="nav-option option1">
                        <i class="fa fa-user-plus"></i>
                        <h3>User</h3>
                    </div>
                    <div class="nav-option option2">
                        <i class="fa fa-tasks"></i>
                        <h3>Category</h3>
                    </div>
                    <div class="nav-option option3">
                        <i class="fa fa-cubes"></i>
                        <h3>Product</h3>
                    </div>
                    <div class="nav-option option4">
                        <i class="fa fa-cart-plus"></i>
                        <h3>Order</h3>
                    </div>
                    <div class="nav-option option5">
                        <i class="fa fa-power-off"></i>
                        <h3>logout</h3>
                    </div>
                </div>
            </div>
            <!--main content-->
            <div class="main">
                <div class="box-container">
                    <div class="box box1">
                        <div class="text">
                            <h2>52.8k</h2>
                            <p>view</p>
                        </div>
                        <i class="fa fa-eye "></i>
                    </div>
                    <div class="box-container">
                        <div class="box box1">
                            <div class="text">
                                <h2>52.8k</h2>
                                <p>view</p>
                            </div>
                            <i class="fa fa-eye "></i>
                        </div>
                        <div class="box-container">
                            <div class="box box1">
                                <div class="text">
                                    <h2>52.8k</h2>
                                    <p>view</p>
                                </div>
                                <i class="fa fa-eye "></i>
                            </div>
                            <div class="box-container">
                                <div class="box box1">
                                    <div class="text">
                                        <h2>52.8k</h2>
                                        <p>view</p>
                                    </div>
                                    <i class="fa fa-eye "></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--report container-->

                    <div class="report-container">
                        <div class="report-header">
                            <h2 class="recent-article">recent article</h2>
                            <button class="view">view</button>
                        </div>
                        <div class="report-body">
                            <div class="report-topic-heading">
                                <h3 class="t-op">hello</h3>
                                <h3 class="t-op">hello</h3>
                                <h3 class="t-op">hello</h3>
                                <h3 class="t-op">hello</h3>
                            </div>
                            <div class="items">
                                <div class="item1">
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl lavel-tag">title</h3>
                                </div>
                                <div class="item1">
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl lavel-tag">title</h3>
                                </div>                                      
                                <div class="item1">
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl lavel-tag">title</h3>
                                </div>
                                <div class="item1">
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl lavel-tag">title</h3>
                                </div>
                                <div class="item1">
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl">title</h3>
                                    <h3 class="t-op-nextlvl lavel-tag">title</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        let icon = document.querySelector(".logo-icon");
                        let nav = document.querySelector(".nav-container");


                        icon.addEventListener("click", () => {
                            nav.classList.toggle("navclose");
                        })

                    </script>

                    </body>
                    </html>
