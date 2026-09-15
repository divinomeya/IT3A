<?php
require_once __DIR__ . '/../../config/config.php';

if(isset($_SESSION['user_id'])){
    logActivity(
         $pdo,
            null,
            $login,
            'logout',
            'failed'
    );
}
      
$_SESSION = [];
session_destroy();
header('Location: ' . BASE_URL . '/index.php');
exit;
?>