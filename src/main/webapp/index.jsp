<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lego Shop - Welcome</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            background:#f5f5f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .header{
            background:#ee4d2d;
            color:white;
            padding:15px 30px;
            display:flex;
            justify-content:space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .header h3 {
            margin: 0;
            font-weight: bold;
        }

        .info-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        .hero-section {
            background: linear-gradient(135deg, #ffffff 0%, #fff0ed 100%);
            border-radius: 15px;
            padding: 50px 30px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }

        .product-card{
            background:white;
            border-radius:10px;
            padding:15px;
            box-shadow:0 2px 10px rgba(0,0,0,0.1);
            transition:0.3s;
            cursor:pointer;
            text-align: center;
        }

        .product-card:hover{
            transform:translateY(-5px);
            box-shadow:0 5px 15px rgba(0,0,0,0.2);
        }

        .price{
            color:#ee4d2d;
            font-weight:bold;
            font-size: 1.1rem;
        }

        /* Thêm một chút hiệu ứng hover cho ảnh minifigure */
        .minifigure-img {
            transition: transform 0.3s ease;
        }
        .minifigure-img:hover {
            transform: scale(1.05) rotate(2deg);
        }
    </style>
</head>

<body>

<div class="header">
    <h3>🧱 KIELIN BRICK STORE </h3>
    <div>
        <a href="${pageContext.request.contextPath}/login" class="btn btn-light btn-sm fw-bold text-danger">Login</a>
        <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-light btn-sm fw-bold ms-2">Register</a>
    </div>
</div>

<div class="container mt-5">

    <div class="row">
        <div class="col-12">
            <div class="hero-section">
                <h1 class="display-5 fw-bold" style="color: #ee4d2d;">Welcome to my lego corner! 🚀</h1>
                <p class="lead mt-3 text-muted">
                    Where tiny bricks build great dreams.
                    Join us in exploring a universe of limitless creativity for all ages!
                </p>
            </div>
        </div>
    </div>

    <div class="row mb-5 align-items-center">

        <div class="col-lg-7 mb-4 mb-lg-0">

            <div class="info-card mb-4">
                <h4 class="fw-bold mb-3" style="color: #333;">✨ Our Begin Story</h4>
                <p class="text-muted mb-0" style="line-height: 1.8;">
                    It all started with an intense passion for colorful bricks. We believe that LEGO is not just a toy, but a magical tool for storytelling, bonding families, and pushing the boundaries of imagination. Every LEGO set you hold in your hands carries an untold story — a story waiting for you to assemble and complete.
            </div>

            <div class="info-card">
                <h4 class="fw-bold mb-3" style="color: #333;">🤝 About US</h4>
                <p class="text-muted" style="line-height: 1.6;">
                    <strong>LEGO SHOP</strong> We are proud to be the leading trusted destination for future builders. We are committed to providing the ultimate experience with:
                </p>
                <ul class="text-muted mb-0" style="line-height: 1.8;">
                    <li><strong>Quality:</strong> Guaranteed authentic products and safety.</li>
                    <li><strong>Diversity:</strong> Constantly updating the newest collections and limited editions(if we can)</li>
                    <li><strong>Dedicated service:</strong> An enthusiastic support team to accompany you on every building project.</li>
                </ul>
            </div>

        </div>

        <div class="col-lg-5">
            <div class="row g-3">
                <div class="col-6 mt-4">
                    <img src="https://images.unsplash.com/photo-1585366119957-e9730b6d0f60?w=400&auto=format&fit=crop"
                         class="img-fluid rounded shadow-sm mb-3 minifigure-img" alt="Minifigure Star Wars">
                    <img src="https://images.unsplash.com/photo-1611604548018-d56bbd85d681?w=400&auto=format&fit=crop"
                         class="img-fluid rounded shadow-sm minifigure-img" alt="Minifigure Classic">
                </div>
                <div class="col-6">
                    <img src="https://images.unsplash.com/photo-1587654780291-39c9404d746b?w=400&auto=format&fit=crop"
                         class="img-fluid rounded shadow-sm mb-3 minifigure-img" alt="Minifigure Action">
                    <div class="p-3 bg-light rounded text-center shadow-sm" style="border: 2px dashed #ee4d2d;">
                        <h5 class="fw-bold text-danger mt-2">Join<br>Our<br>Squad!</h5>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <hr class="mb-5 text-muted">

    <h4 class="fw-bold mb-4">🔥 Register now to discover our featured products</h4>


</script>

</body>
</html>