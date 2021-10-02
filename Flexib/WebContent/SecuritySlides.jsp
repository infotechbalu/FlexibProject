<!DOCTYPE html>
<%
//Object role=session.getAttribute("testtype");
//Object username=session.getAttribute("username");
try{
if(session.getAttribute("username").equals("null") || session.getAttribute("username").equals("")){
	session.invalidate(); 
	response.sendRedirect("index.jsp");
	//getServletContext().getRequestDispatcher("index.jsp").include(request,response);
}
else{
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}

.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}


</style>
</head>
<body>

<div class="slideshow-container" style="padding-left: 50px; width: 800px; height: 400px;padding-top: 0px;">

<div class="mySlides fade">
  <div class="numbertext">1 / 6</div>
  <img  src="Projects/Security Testing/Slides/Slide1.png" style="width:100%">
  <!--<div class="text">Caption Text</div>  -->
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 6</div>
  <img src="Projects/Security Testing/Slides/Slide2.png" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 6</div>
  <img src="Projects/Security Testing/Slides/Slide3.png" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 6</div>
  <img src="Projects/Security Testing/Slides/Slide4.png" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 6</div>
  <img src="Projects/Security Testing/Slides/Slide5.png" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext">6 / 6</div>
  <img src="Projects/Security Testing/Slides/Slide6.png" style="width:100%">
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
 <%}				
				}
				catch(Exception sqe){
					session.invalidate(); 
					response.sendRedirect("index.jsp");
				}%>
</body>
</html> 
