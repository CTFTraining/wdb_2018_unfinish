<?php

    session_start();
    error_reporting(0);
    function dbconnection()
    {
        @$con = mysql_connect("localhost","root","b84f73327300021c961c2ce1f9d0dcdc");
        if (!$con)
        {
                echo "Failed to connect to MySQL: " . mysql_error();
        }
        @mysql_select_db("web",$con) or die ( "Unable to connect to the database");
        mysql_query("SET character set 'UTF8'");
    }
    function waf($str){
        $black_list = "/,|information|".urldecode('%09')."|".urldecode("%0a")."|".urldecode("%0b")."|".urldecode('%0c')."|".urldecode('%0d')."|".urldecode('%a0')."/i";
        if(preg_match($black_list,$str)){
            die("nnnnoooo!!!");
        }
        return $str;
    }

?>