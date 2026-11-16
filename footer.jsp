<!-- footer.jsp - Clean Version -->
<style>
    .main-footer {
        background: #1a1a2e;
        color: white;
        margin-top: 60px;
        padding: 40px 20px 20px 20px;
        clear: both;
    }
    
    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        gap: 30px;
    }
    
    .footer-section {
        flex: 1;
        min-width: 200px;
    }
    
    .footer-section h3, .footer-section h4 {
        margin-bottom: 15px;
        color: #fff;
    }
    
    .footer-section h3 i, .footer-section h4 i {
        color: #667eea;
        margin-right: 8px;
    }
    
    .footer-section p {
        opacity: 0.8;
        line-height: 1.6;
        margin: 8px 0;
    }
    
    .footer-section a {
        color: white;
        text-decoration: none;
        opacity: 0.8;
        transition: opacity 0.3s;
        display: inline-block;
        margin: 5px 0;
    }
    
    .footer-section a:hover {
        opacity: 1;
    }
    
    .social-links a {
        margin-right: 15px;
        font-size: 20px;
    }
    
    .footer-bottom {
        text-align: center;
        padding-top: 20px;
        margin-top: 30px;
        border-top: 1px solid rgba(255,255,255,0.1);
        font-size: 14px;
        opacity: 0.7;
    }
    
    @media (max-width: 768px) {
        .footer-container {
            flex-direction: column;
            text-align: center;
        }
        .social-links a {
            margin: 0 10px;
        }
    }
</style>

<footer class="main-footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3><i class="fas fa-shopping-bag"></i> ShopEase</h3>
            <p>Your one-stop shop for quality products at best prices. Shop with confidence!</p>
        </div>
        
        <div class="footer-section">
            <h4><i class="fas fa-link"></i> Quick Links</h4>
            <p><a href="home.jsp">🏠 Home</a></p>
            <p><a href="myCart.jsp">🛒 My Cart</a></p>
            <p><a href="myOrders.jsp">📦 My Orders</a></p>
            <p><a href="messageUs.jsp">📧 Contact Us</a></p>
        </div>
        
        <div class="footer-section">
            <h4><i class="fas fa-headset"></i> Customer Service</h4>
            <p><a href="#">❓ FAQ</a></p>
            <p><a href="#">📝 Return Policy</a></p>
            <p><a href="#">🔒 Privacy Policy</a></p>
            <p><a href="#">📜 Terms & Conditions</a></p>
        </div>
        
        <div class="footer-section">
            <h4><i class="fas fa-address-card"></i> Contact Info</h4>
            <p><i class="fas fa-envelope"></i> support@shopease.com</p>
            <p><i class="fas fa-phone"></i> +91 98765 43210</p>
            <p><i class="fab fa-whatsapp"></i> +91 98765 43210</p>
            <div class="social-links">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>&copy; 2026 ShopEase. All rights reserved. | Designed with <i class="fas fa-heart" style="color: #ff6b6b;"></i> for you!</p>
    </div>
</footer>