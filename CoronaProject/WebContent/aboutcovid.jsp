<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.2/TweenMax.min.js"></script>
  
  <link rel="stylesheet" href="css/leftnav.css">
  
  <link rel="stylesheet" href="css/style_about.css">
  
   <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Muli:wght@500&display=swap" rel="stylesheet">

  <title>About Corona</title>

</head>

<body>
  <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
  <div class="overlay">
    <h1>COVID-19</h1>
    <span style="color:#006dcc; font-weight: bold;" >INDIA</span>
  </div>
  <div class="nav-c">
  <c:import url="leftnav.jsp"/>
  </div>
 <!-- <div class="wrapper1">
    <div class="sidebar">
        <h2 style="color:#ffffff;">COVID-19</h2>
        <ul>
            <li><a href="dashboard.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="down_report.jsp"><i class="fa fa-download"></i> Download Report</a></li>
            <li><a href="https://indianexpress.com/article/india/coronavirus-india-live-updates-lockdown-latest-news-covid-19-vaccine-covid-19-tracker-corona-cases-in-india-today-news-update-6502632/"><i class="fa fa-question-circle"></i> News COVID-19</a></li>
            <li><a href="about_covid.html"><i class="fa fa-question-circle"></i> About COVID-19</a></li>
            <li><a href="contact.html"><i class="fa fa-user-circle"></i> Developer</a></li>
      
        </ul> 
        </div>
        </div> -->

  <div class="wrapper">

   

    <div class="text">
      <div class="title">COVID-19</div>
      <p style="font-weight: bold">BE READY TO FIGHT WITH THE<br>CORONA VIRUS</p>
    </div>

    <div class="watchnow">
      <i class="fa fa-play"></i>
      <a target="_new" href="https://www.youtube.com/watch?v=YwhL98NiCcc">Coronavirus Live Map</a>
    </div>
    <div class="image_corona">
    
   
    <div class="ellipse-container">
      <div class="ellipse thin"></div>
      <div class="ellipse thick"></div>
      <div class="ellipse yellow"></div>
      <div class="circle1"><span>STAYING HOME, SAVES LIVES</span></div>
      <div class="circle2"><span>PRAYERS AGAINST CORONA VIRUS</span></div>
    </div>
</div>


  <script>

    TweenMax.to(".overlay h1", 2, {
      opacity: 0,
      y: -60,
      ease: Expo.easeInOut
    })

    TweenMax.to(".overlay span", 2, {
      delay: .3,
      opacity: 0,
      y: -60,
      ease: Expo.easeInOut
    })

    TweenMax.to(".overlay", 2, {
      delay: 1,
      top: "-100%",
      ease: Expo.easeInOut
    })

    TweenMax.from(".ellipse-container", 1, {
      delay: 2,
      opacity: 0,
      ease: Expo.easeInOut
    })

    TweenMax.from(".yellow", 1, {
      delay: 3.5,
      opacity: 0,
      ease: Expo.easeInOut
    })

    TweenMax.from(".circle1", 1, {
      delay: 2.4,
      opacity: 0,
      ease: Expo.easeInOut
    })

    TweenMax.from(".circle2", 1, {
      delay: 2.6,
      opacity: 0,
      ease: Expo.easeInOut
    })

  
   

    TweenMax.from(".text .title", 1, {
      delay: 3,
      opacity: 0,
      x: 200,
      ease: Expo.easeInOut
    })

    TweenMax.from(".text p", 1, {
      delay: 3.2,
      opacity: 0,
      x: 200,
      ease: Expo.easeInOut
    })

    TweenMax.from(".watchnow", 1, {
      delay: 3.4,
      opacity: 0,
      x: 200,
      ease: Expo.easeInOut
    })

    TweenMax.staggerFrom(".media ul li", 1, {
      delay: 3,
      opacity: 0,
      y: 100,
      ease: Expo.easeInOut
    }, 0.08)

  </script>

  <div class="questions">
<section>
         <h2>What is COVID-19?</h2>
         <p>COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019. COVID-19 is now a pandemic affecting many countries globally.</p>
    </section>

    <section>
          <h2>What are the symptoms of COVID-19?</h2>
  <p>The most common symptoms of COVID-19 are fever, dry cough, and tiredness. Other symptoms that are less common and may affect some patients include aches and pains, nasal congestion, headache, conjunctivitis, sore throat, diarrhea, loss of taste or smell or a rash on skin or discoloration of fingers or toes. These symptoms are usually mild and begin gradually. Some people become infected but only have very mild symptoms.</p>
</section>
 <section>
          <h2>How does the virus spread?</h2>
  <p>The virus that causes COVID-19 is thought to spread mainly from person to person, mainly through respiratory droplets produced when an infected person coughs, sneezes, or talks. These droplets can land in the mouths or noses of people who are nearby or possibly be inhaled into the lungs. Spread is more likely when people are in close contact with one another (within about 6 feet).</p>
</section>
 <section>
          <h2>What is Community spread?</h2>
  <p>Community spread means people have been infected with the virus in an area, including some who are not sure how or where they became infected. Each health department determines community spread differently based on local conditions. For information on community spread in your area, please visit your health department’s website.​</p>
</section>
 <section>
          <h2>What is the recovery time for the coronavirus disease?</h2>
  <p>Using available preliminary data, the median time from onset to clinical recovery for mild cases is approximately 2 weeks and is 3-6 weeks for patients with severe or critical disease.</p>
</section>
 <section>
          <h2>How dangerous is the coronavirus disease?</h2>
  <p>Although for most people COVID-19 causes only mild illness, it can make some people very ill. More rarely, the disease can be fatal. Older people, and those with pre- existing medical conditions (such as high blood pressure, heart problems or diabetes) appear to be more vulnerable.</p>
</section>
 <section>
          <h2>Who should be quarantined during the COVID-19 pandemic?</h2>
  <p>The most common symptoms of COVID-19 are fever, dry cough, and tiredness. Other symptoms that are less common and may affect some patients include aches and pains, nasal congestion, headache, conjunctivitis, sore throat, diarrhea, loss of taste or smell or a rash on skin or discoloration of fingers or toes. These symptoms are usually mild and begin gradually. Some people become infected but only have very mild symptoms.</p>
</section>

</div>  

</div>

<footer>
  


</footer>
</body>
</html>