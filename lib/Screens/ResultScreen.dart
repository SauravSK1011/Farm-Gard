import 'dart:ffi';
import 'dart:io';

import 'package:agroscan/Screens/Searchscreen.dart';
import 'package:agroscan/Screens/lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

class Result extends StatefulWidget {
  Result(
      {super.key,
      required this.result,
      required this.confidence,
      required this.image,
      required this.lang,
      required this.nameinM});
  String result;
  var confidence;
  File image;
  String lang;
  String nameinM;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String precautions = '';
  String precautionsm = '';

  @override
  Widget build(BuildContext context) {
    switch (widget.result) {
      case 'Apple___Apple_scab':
        precautions = widget.lang == 'English'
            ? "The first symptoms of this disease are found in the foliage, blossoms, and developing fruits of affected trees, which develop dark, irregularly-shaped lesions upon infection. Although apple scab rarely kills its host, infection typically leads to fruit deformation and premature leaf and fruit drop, which enhance the susceptibility of the host plant to abiotic stress and secondary infection."
            : "या रोगाची पहिली लक्षणे प्रभावित झाडांची पाने, मोहोर आणि विकसनशील फळांमध्ये आढळतात, ज्यात संसर्ग झाल्यानंतर गडद, अनियमित-आकाराचे जखम होतात. जरी सफरचंद खरडणे त्याच्या यजमानाला क्वचितच मारत असले तरी, संसर्गामुळे फळांचे विकृत रूप आणि अकाली पाने आणि फळे गळतात, ज्यामुळे यजमान वनस्पतीची अजैविक ताण आणि दुय्यम संसर्गाची संवेदनशीलता वाढते.";
        break;
      case 'Apple___Black_rot':
        precautions = widget.lang == 'English'
            ? "Black rot is an important disease of apple caused by the fungus Botryosphaeria obtusa. Black rot fungus infects a wide variety of hardwood trees, including apple and pear. Infected trees are often a source of infection for nearby younger bearing blocks. The black rot pathogen infects limbs, trunks, leaves and fruit resulting in reduced productivity and quality of yield. Leaf infections result in a disease called frog-eye leaf spot. "
            : "ब्लॅक रॉट हा सफरचंदाचा एक महत्त्वाचा रोग आहे जो बोट्रिओस्फेरिया ओब्टुसा या बुरशीमुळे होतो. ब्लॅक रॉट फंगस सफरचंद आणि नाशपातीसह विविध प्रकारच्या हार्डवुड झाडांना संक्रमित करते. संक्रमित झाडे बहुतेक वेळा जवळच्या लहान बेअरिंग ब्लॉक्ससाठी संसर्गाचे स्रोत असतात. काळा रॉट रोगकारक हातपाय, खोड, पाने आणि फळांना संक्रमित करतो परिणामी उत्पादकता आणि उत्पादनाची गुणवत्ता कमी होते. ";
        break;
      case 'Apple___Cedar_apple_rust':
        precautions = widget.lang == 'English'
            ? "Cedar apple rust is a member of the family Pucciniaceae, a group of fungi that contains many species that usually require two or more hosts to complete the life cycle. Members of this family are known as rusts because the color of many is orange or reddish at some point in the life cycle. Many rusts are disease agents of crop plants including black stem rust of wheat, soybean rust and white pine blister rust."
            : "सिडर ऍपल रस्ट हे पुक्किनियासी कुटुंबातील सदस्य आहे, बुरशीचा एक समूह ज्यामध्ये अनेक प्रजाती असतात ज्यांना जीवन चक्र पूर्ण करण्यासाठी सामान्यतः दोन किंवा अधिक यजमानांची आवश्यकता असते. या कुटुंबातील सदस्यांना गंज म्हणून ओळखले जाते कारण अनेकांचा रंग जीवन चक्रात कधीतरी केशरी किंवा लालसर असतो. गव्हाच्या काळ्या देठाचा गंज, सोयाबीनचा गंज आणि पांढरा पाइन ब्लिस्टर गंज यासह अनेक गंज पीक वनस्पतींचे रोगकारक असतात. तीन ते पाच वेगवेगळ्या प्रकारचे बीजाणू गंजांमुळे तयार होतात, परंतु एक नेहमीच बेसिडिओस्पोर असतो";
        break;
      case 'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot':
        precautions = widget.lang == 'English'
            ? "Grey leaf spot (GLS) is a foliar fungal disease that affects maize, also known as corn. GLS is considered one of the most significant yield-limiting diseases of corn worldwide. There are two fungal pathogens that cause GLS: Cercospora zeae-maydis and Cercospora zeina Symptoms seen on corn include leaf lesions, discoloration."
            : "ग्रे लीफ स्पॉट (GLS) हा एक पर्णासंबंधी बुरशीजन्य रोग आहे जो मक्यावर परिणाम करतो, ज्याला कॉर्न देखील म्हणतात. जीएलएस हा जगभरातील कॉर्नचा सर्वात लक्षणीय उत्पादन मर्यादित करणारा रोग मानला जातो. GLS कारणीभूत असलेले दोन बुरशीजन्य रोगजनक आहेत: Cercospora zeae-maydis आणि Cercospora zeina कॉर्नवर दिसणार्‍या लक्षणांमध्ये पानांचे घाव, विरंगुळा आणि पानांचा तुषार यांचा समावेश होतो. GLS ची विशिष्ट लक्षणे म्हणजे आयताकृती, तपकिरी ते राखाडी नेक्रोटिक विकृती जे पानाला समांतर चालतात, दुय्यम पानांच्या शिरा दरम्यानच्या अंतरावर पसरतात.";
        break;
      case 'Corn_(maize)___Common_rust':
        precautions = widget.lang == 'English'
            ? "Common rust is caused by the fungus Puccinia sorghi and occurs every growing season. It is seldom a concern in hybrid corn. Rust pustules usually first appear in late June. Early symptoms of common rust are chlorotic flecks on the leaf surface. These soon develop into powdery, brick-red pustules as the spores break through the leaf surface."
            : "सामान्य गंज पुक्किनिया सोर्गी या बुरशीमुळे होतो आणि प्रत्येक वाढीच्या हंगामात होतो. हायब्रीड कॉर्नमध्ये ही क्वचितच चिंता असते. रस्ट पस्टुल्स सहसा जूनच्या शेवटी दिसतात. सामान्य गंजाची सुरुवातीची लक्षणे म्हणजे पानांच्या पृष्ठभागावर क्लोरोटिक फ्लेक्स. बीजाणू पानांच्या पृष्ठभागावरुन फुटल्याने ते लवकरच पावडर, वीट-लाल पुसट्यांमध्ये विकसित होतात. ";
        break;
      case 'Corn_(maize)___Northern_Leaf_Blight':
        precautions = widget.lang == 'English'
            ? "The most common diagnostic symptom of the disease on corn is cigar-shaped or elliptical necrotic gray-green lesions on the leaves that range from one to seven inches long. These lesions may first appear as narrow, tan streaks that run parallel to the leaf veins."
            : "कॉर्नवरील रोगाचे सर्वात सामान्य निदान लक्षण म्हणजे एक ते सात इंच लांबीच्या पानांवर सिगार-आकाराचे किंवा लंबवर्तुळाकार नेक्रोटिक राखाडी-हिरवे घाव.[3] हे व्रण प्रथम अरुंद, टॅन रेक्‍स म्‍हणून दिसू शकतात जे पानांच्या नसांना समांतर चालतात. बीजाणू (कोनिडिया) तयार झाल्यामुळे, पूर्णपणे विकसित झालेल्या जखमांमध्ये सामान्यत: दमट हवामानात काजळीचे स्वरूप असते. रोग जसजसा वाढतो तसतसे जखम एकत्र वाढतात आणि मृत पानांच्या ऊतींचे मोठे क्षेत्र तयार करतात.";
        break;
      case 'Potato___Early_blight':
        precautions = widget.lang == 'English'
            ? "Between crops, the early blight fungus can overwinter on potato refuse in the field, in soil, on tubers, and on other solanaceous plants. Infection occurs when spores of the fungus come in contact with susceptible leaves and sufficient free moisture is present."
            : "पिकांच्या दरम्यान, लवकर अनिष्ट बुरशीची बुरशी हिवाळ्यामध्ये बटाट्याच्या शेतात, मातीत, कंदांवर आणि इतर सोलनेसियस वनस्पतींवर मारू शकते. जेव्हा बुरशीचे बीजाणू संवेदनाक्षम पानांच्या संपर्कात येतात आणि पुरेसा मुक्त ओलावा असतो तेव्हा संसर्ग होतो. बीजाणू उगवण आणि संक्रमणास उबदार हवामान आणि दव, पाऊस किंवा तुषार सिंचनामुळे ओले वातावरण अनुकूल आहे. ";
        break;
      case 'Potato___Late_blight':
        precautions = widget.lang == 'English'
            ? "Late blight is a deadly fungus that damages potatoes. It is available all around the world. It can be found in potato-growing regions around the world. In India, the main potato-growing season is winter. In the plains, it is followed by hot summer months. The fungus in the soil is killed by dryness and high temperatures."
            : "लेट ब्लाईट ही एक घातक बुरशी आहे जी बटाट्याचे नुकसान करते. हे जगभर उपलब्ध आहे. हे जगभरातील बटाटा-उत्पादक प्रदेशांमध्ये आढळू शकते. भारतात, बटाटा पिकवण्याचा मुख्य हंगाम हिवाळा आहे. मैदानी भागात, त्यानंतर उष्ण उन्हाळ्याचे महिने येतात. कोरडेपणा आणि उच्च तापमानामुळे जमिनीतील बुरशी नष्ट होते. तपशिलांवर चर्चा करण्याआधी आणि ब्लाइटचा अर्थ आपण कारक घटकांकडे पाहू या. बटाट्याचा उशीरा होणारा प्रकोप हा फायटोफथोरा इन्फेस्टन या बुरशीमुळे होतो, जो आता सर्वात सामान्य पीक रोगकारक आहे, जे प्रभावी नियंत्रण खबरदारी न घेतल्यास कमी वेळेत पीक अपयशी ठरू शकते. महामारीच्या वर्षांमध्ये, बटाटा पिकांची घट 80% पर्यंत पोहोचू शकते.";
        break;
      case 'Grape__black_measles':
        precautions = widget.lang == 'English'
            ? "The foliar symptom of Esca is an interveinal striping. The stripes, which start out as dark red in red cultivars and yellow in white cultivars, dry and become necrotic. Foliar symptoms may occur at any time during the growing season, but are most prevalent during July and August. They are often restricted to an individual shoot or to shoots originating from the same spur or cane."
            : "एस्काचे पर्णासंबंधी लक्षण म्हणजे इंटरवेनल स्ट्रिपिंग होय. पट्टे, जे लाल जातींमध्ये गडद लाल आणि पांढर्‍या जातींमध्ये पिवळ्या रंगाचे असतात, ते कोरडे होतात आणि नेक्रोटिक बनतात. वाढत्या हंगामात पर्णसंभाराची लक्षणे कधीही दिसू शकतात, परंतु जुलै आणि ऑगस्टमध्ये जास्त प्रमाणात आढळतात. ते सहसा वैयक्तिक शूट किंवा त्याच स्पर किंवा छडीपासून उद्भवलेल्या शूटसाठी मर्यादित असतात. लक्षणेयुक्त पाने पूर्णपणे सुकतात आणि अकाली गळतात. बेरीवर, तपकिरी-जांभळ्या रिंगने किनारी असलेले लहान, गोलाकार, गडद ठिपके दिसू शकतात. हे फळ डाग, जे पांढर्‍या जातींवर चांगले दिसतात, ते फळांच्या सेट आणि पिकण्याच्या दरम्यान कधीही दिसू शकतात. गंभीरपणे प्रभावित वेलींमध्ये, बेरी अनेकदा तडकतात आणि कोरड्या होतात किंवा खराब होतात. ";
        break;
      case 'Grape__black_rot':
        precautions = widget.lang == 'English'
            ? "Grape black rot is a fungal disease caused by an ascomycetous fungus, Guignardia bidwellii, that attacks grape vines during hot and humid weather. “Grape black rot originated in eastern North America, but now occurs in portions of Europe, South America, and Asia. It can cause complete crop loss in warm, humid climates, but is virtually unknown in regions with arid summers."
            : "द्राक्षाच्या काळ्या रॉटचा उगम पूर्व उत्तर अमेरिकेत झाला, परंतु आता युरोप, दक्षिण अमेरिका आणि आशियाच्या काही भागांमध्ये आढळतो. उबदार, दमट हवामानात यामुळे पिकाचे संपूर्ण नुकसान होऊ शकते, परंतु कोरड्या उन्हाळ्याच्या प्रदेशात ते अक्षरशः अज्ञात आहे.” [१] हे नाव पानांवर तपकिरी ठिपके वाढणाऱ्या काळ्या किनार्यावरून आले आहे. हा रोग वनस्पतीच्या इतर भागांवर देखील हल्ला करतो, “वेलीचे सर्व हिरवे भाग: कोंब, पान आणि फळांचे दांडे, कांदे आणि फळे. सर्वात हानीकारक परिणाम फळांवर होतो.";
        break;
      case 'Grape__leaf_blight_(isariopsis_leaf_spot)':
        precautions = widget.lang == 'English'
            ? "On leaf surface we will see lesions which are irregularly shaped (2 to 25 mm in diameter). Initially lesions are dull red to brown in color turn black later. If disease is severe this lesions may coalesce. On berries we can see symptom similar to black rot but the entire clusters will collapse.Fungicides sprayed for other diseases in the season may help to reduce this disease."
            : "पानांच्या पृष्ठभागावर आपल्याला अनियमित आकाराचे (2 ते 25 मिमी व्यासाचे) घाव दिसतील. सुरुवातीला घाव मंद लाल ते तपकिरी रंगाचे असतात नंतर काळे होतात. जर रोग गंभीर असेल तर हे घाव एकत्र येऊ शकतात. बेरीवर आपण काळ्या कुजण्यासारखी लक्षणे पाहू शकतो परंतु संपूर्ण पुंजके कोलमडून जातील. हंगामात इतर रोगांसाठी फवारणी केलेली बुरशीनाशके हा रोग कमी करण्यास मदत करू शकतात.";
        break;
      case 'Tomato___Bacterial_spot':
        precautions = widget.lang == 'English'
            ? "Bacterial spot develops on seedlings and mature plants. On seedlings, infections may cause severe defoliation. On older plants, infections occur primarily on older leaves and appear as water-soaked areas."
            : "बॅक्टेरियल स्पॉट रोपे आणि प्रौढ वनस्पतींवर विकसित होतात. रोपांवर, संक्रमणामुळे गंभीर विघटन होऊ शकते. जुन्या झाडांवर, संक्रमण प्रामुख्याने जुन्या पानांवर होते आणि ते पाण्याने भिजलेल्या भागात दिसतात. ";
        break;
      case 'Tomato___Early_blight':
        precautions = widget.lang == 'English'
            ? "Symptoms of early blight can occur on the foliage, fruit, and stem at any stage of development. The disease is more commonly observed in the field, however, seedlings in the greenhouse can be affected by collar rot (also caused by species of Alternaria).Lesions first develop on lower leaves as small, brownish-black spots which can expand to about 1⁄4 - 1⁄2-inch in diameter with characteristic concentric rings in the darkened area."
            : "लवकर अनिष्ट लक्षणे विकासाच्या कोणत्याही टप्प्यावर पर्णसंभार, फळे आणि खोडावर दिसू शकतात. हा रोग शेतात अधिक प्रमाणात दिसून येतो, तथापि, हरितगृहातील रोपे कॉलर रॉट (अल्टरनेरियाच्या प्रजातींमुळे देखील) प्रभावित होऊ शकतात. जखम प्रथम खालच्या पानांवर लहान, तपकिरी-काळ्या डागांच्या रूपात विकसित होतात ज्याचा विस्तार सुमारे 1⁄4 - 1⁄2-इंच व्यासासह गडद भागात वैशिष्ट्यपूर्ण संकेंद्रित वलयांसह होऊ शकतो. जखमांच्या आजूबाजूचा भाग पिवळा होऊ शकतो आणि रोग वाढल्याने संपूर्ण पान पिवळी होऊ शकते. ";
        break;
      case 'Tomato___Late_blight':
        precautions = widget.lang == 'English'
            ? "Symptoms of late blight may be found on any above-ground part of the tomato plant. Infected leaves typically have green to brown patches of dead tissue surrounded by a pale green or gray border. When the weather is very humid and wet, late blight infections can appear water-soaked or dark brown in color, and are often described as appearing greasy."
            : "टोमॅटोच्या झाडाच्या जमिनीच्या वरच्या भागावर उशीरा ब्लाइटची लक्षणे आढळू शकतात. संक्रमित पानांवर सामान्यत: हिरवे ते तपकिरी रंगाचे मृत ऊतींचे ठिपके असतात ज्याभोवती फिकट हिरवी किंवा राखाडी सीमा असते. जेव्हा हवामान खूप दमट आणि ओले असते, तेव्हा उशीरा ब्लाइट संक्रमण पाण्यात भिजलेले किंवा गडद तपकिरी रंगाचे दिसू शकते आणि बहुतेक वेळा ते स्निग्ध दिसणे म्हणून वर्णन केले जाते. पांढरी, अस्पष्ट वाढ पानांच्या खालच्या बाजूस किंवा खालच्या देठावर आढळू शकते.";
        break;
      case 'Tomato___Leaf_Mold':
        precautions = widget.lang == 'English'
            ? "The tomato leaf mold fungus is a specific pathogen of tomato plant Lycopersicon, this pathogen has restricted host range (host specific pathogen) that only infects tomatoes, mainly in greenhouses. The symptoms of this disease commonly occurs on foliage, and it develops on both sides of the leaf on the adaxial and abaxial surface."
            : "टोमॅटो लीफ मोल्ड बुरशी हे टोमॅटो प्लांट लाइकोपर्सिकॉनचे विशिष्ट रोगजनक आहे, या रोगजनकामध्ये यजमान श्रेणी (होस्ट स्पेसिफिक पॅथोजेन) मर्यादित आहे जी केवळ टोमॅटोला संक्रमित करते, प्रामुख्याने ग्रीनहाऊसमध्ये. या रोगाची लक्षणे सामान्यतः पर्णसंभारावर आढळतात आणि ती पानाच्या दोन्ही बाजूंना अडॅक्सियल आणि अॅबॅक्सियल पृष्ठभागावर विकसित होते. ";
        break;
      case 'Tomato___Septoria_leaf_spot':
        precautions = widget.lang == 'English'
            ? "Septoria leaf spot usually appears on the lower leaves after the first fruit sets. Spots are circular, about 1/16 to 1/4 inch in diameter with dark brown margins and tan to gray centers with small black fruiting structures. Characteristically, there are many spots per leaf."
            : "सेप्टोरिया पानावर डाग सामान्यतः पहिल्या फळाच्या सेटनंतर खालच्या पानांवर दिसतात. डाग गोलाकार असतात, गडद तपकिरी मार्जिनसह सुमारे 1/16 ते 1/4 इंच व्यासाचे असतात आणि लहान काळ्या फळांच्या रचनांसह टॅन ते राखाडी केंद्र असतात. वैशिष्ट्यपूर्णपणे, प्रत्येक पानावर अनेक डाग असतात. हा रोग वृद्ध ते सर्वात लहान वाढीपर्यंत वरच्या दिशेने पसरतो. पानावर अनेक जखमा असल्यास, पाने किंचित पिवळी, नंतर तपकिरी आणि नंतर कोमेजतात. फळांचा संसर्ग दुर्मिळ आहे.";
        break;
      case 'Tomato___Spider_mites Two-spotted_spider_mite':
        precautions = widget.lang == 'English'
            ? "The two-spotted spider mite is the most common mite species that attacks vegetable and fruit crops in New England. Spider mites can occur in tomato, eggplant, potato, vine crops such as melons, cucumbers, and other crops. Two-spotted spider mites are one of the most important pests of eggplant."
            : "न्यू इंग्लंडमधील भाजीपाला आणि फळांच्या पिकांवर हल्ला करणारी दोन-स्पॉटेड स्पायडर माइट ही सर्वात सामान्य माइट प्रजाती आहे. टोमॅटो, वांगी, बटाटा, खरबूज, काकडी आणि इतर पिकांमध्ये कोळी माइट्स येऊ शकतात. दोन-स्पॉटेड स्पायडर माइट्स हे वांग्यातील सर्वात महत्वाचे कीटक आहेत. त्यांच्या वर्षाला 20 पिढ्या असतात आणि जास्त नायट्रोजन आणि कोरड्या आणि धूळयुक्त परिस्थितीमुळे ते अनुकूल असतात. ";
        break;
      case 'Tomato___Target_Spot':
        precautions = widget.lang == 'English'
            ? "Target spot infections reduce yield indirectly by reducing the photosynthetic area and directly by reducing the fruit’s marketability through fruit spots. One study documented a 30% reduction in marketable yield and a 43% reduction in extra-large fruit when comparing production from treated and untreated plants."
            : "टार्गेट स्पॉट इन्फेक्शन्स अप्रत्यक्षपणे प्रकाशसंश्लेषण क्षेत्र कमी करून आणि फळांच्या डागांमुळे फळांची विक्रीक्षमता कमी करून अप्रत्यक्षपणे उत्पादन कमी करतात. एका अभ्यासात प्रक्रिया केलेल्या आणि उपचार न केलेल्या वनस्पतींपासून उत्पादनाची तुलना करताना विक्रीयोग्य उत्पादनात 30% घट आणि अतिरिक्त-मोठ्या फळांमध्ये 43% घट झाल्याचे दस्तऐवजीकरण केले आहे.";
        break;
      case 'Tomato___Tomato_mosaic_virus':
        precautions = widget.lang == 'English'
            ? "The foliage of affected tomato plants shows mottling, with alternating yellowish and darker green areas, the latter often appearing thicker and raised giving a blister-like appearance. The leaves tend to be fern-like in appearance with pointed tips and younger leaves may be twisted."
            : "प्रभावित टोमॅटोच्या झाडाची पाने पिवळसर आणि गडद हिरव्या भागांसह चिवट व लकाकणारा पदार्थ दर्शवितात, नंतरचे बहुतेकदा दाट आणि वरचेवर फोडासारखे दिसतात. टोकदार टिपांसह पाने फर्नसारखी दिसतात आणि कोवळी पाने मुरलेली असू शकतात. फळ विकृत असू शकते, पिकलेल्या आणि हिरव्या दोन्ही फळांवर पिवळे डाग आणि नेक्रोटिक डाग येऊ शकतात आणि फळांच्या भिंतीवर अंतर्गत तपकिरी होऊ शकते. कोवळ्या झाडांमध्ये, संसर्गामुळे फळांचा संच कमी होतो आणि त्यामुळे विकृती आणि डाग येऊ शकतात.";
        break;
      case 'Tomato___Tomato_Yellow_Leaf_Curl_Virus':
        precautions = widget.lang == 'English'
            ? "Symptoms of TYLCV infection include severe stunting, reduction of leaf size, upward cupping/curling of leaves, chlorosis on leaves and flowers, and reduction of fruit production. This virus can cause significant yield losses from 90–100%, and it is estimated that about 7 million hectares can experience TYLCV infection or mixed virus infections annually. Treatments that are commonly used for this disease include insecticides, hybrid seeds, and growing tomatoes under greenhouse conditions."
            : "टीवायएलसीव्ही संसर्गाच्या लक्षणांमध्ये तीव्र वाढ, पानांचा आकार कमी होणे, पानांचा वरचा कपाट/कुरळे येणे, पाने आणि फुलांवर क्लोरोसिस आणि फळांचे उत्पादन कमी होणे यांचा समावेश होतो. या विषाणूमुळे 90-100% पर्यंत उत्पन्नाचे लक्षणीय नुकसान होऊ शकते आणि असा अंदाज आहे की सुमारे 7 दशलक्ष हेक्टरमध्ये दरवर्षी TYLCV संसर्ग किंवा मिश्र विषाणू संसर्गाचा अनुभव येऊ शकतो. या रोगासाठी सामान्यतः वापरल्या जाणार्‍या उपचारांमध्ये कीटकनाशके, संकरित बियाणे आणि हरितगृह परिस्थितीत वाढणारे टोमॅटो यांचा समावेश होतो.";
        break;
      case 'Rice___Neck_Blast':
        precautions = widget.lang == 'English'
            ? "The symptoms of rice blast include lesions that can be found on all parts of the plant, including leaves, leaf collars, necks, panicles, pedicels, and seeds. A recent report shows that even roots can become infected. However, the most common and diagnostic symptom, diamond shaped lesions, of rice blast occur on the leaves, whereas lesions on the sheaths are relatively rare."
            : "तांदूळ स्फोटाच्या लक्षणांमध्ये पाने, पानांच्या कॉलर, मान, पॅनिकल्स, पेडिसेल्स आणि बियांसह झाडाच्या सर्व भागांवर आढळणारे जखम समाविष्ट आहेत. अलीकडील अहवालात असे दिसून आले आहे की मुळांना देखील संसर्ग होऊ शकतो. तथापि, सर्वात सामान्य आणि निदानात्मक लक्षण, हिऱ्याच्या आकाराचे घाव, तांदूळाच्या स्फोटाचे पानांवर आढळतात, तर आवरणावरील जखम तुलनेने दुर्मिळ असतात.";
        break;
      case 'Rice___Leaf_Blast':
        precautions = widget.lang == 'English'
            ? "The symptoms of rice blast include lesions that can be found on all parts of the plant, including leaves, leaf collars, necks, panicles, pedicels, and seeds. A recent report shows that even roots can become infected. However, the most common and diagnostic symptom, diamond shaped lesions, of rice blast occur on the leaves, whereas lesions on the sheaths are relatively rare."
            : "तांदूळ स्फोटाच्या लक्षणांमध्ये पाने, पानांच्या कॉलर, मान, पॅनिकल्स, पेडिसेल्स आणि बियांसह झाडाच्या सर्व भागांवर आढळणारे जखम समाविष्ट आहेत. अलीकडील अहवालात असे दिसून आले आहे की मुळांना देखील संसर्ग होऊ शकतो. तथापि, सर्वात सामान्य आणि निदानात्मक लक्षण, हिऱ्याच्या आकाराचे घाव, तांदूळाच्या स्फोटाचे पानांवर आढळतात, तर आवरणावरील जखम तुलनेने दुर्मिळ असतात.";
        break;
      case 'Rice___Brown_Spot':
        precautions = widget.lang == 'English'
            ? "Brown spot is an indicator of unfavorable growing conditions, including insufficient nitrogen, inability of the plants to use nitrogen because of rice water weevil injury, root rot or other unfavorable soil conditions."
            : "तपकिरी ठिपके हे अपुरे नायट्रोजन, तांदळाच्या पाण्यामुळे भुंग्याला दुखापत झाल्यामुळे नायट्रोजन वापरण्यास झाडांची असमर्थता, मूळ कुजणे किंवा मातीची इतर प्रतिकूल परिस्थिती यासह प्रतिकूल वाढीच्या परिस्थितीचे सूचक आहे.";
        break;
      case 'Wheat___Yellow_Rust(Stripe Rust)':
        precautions = widget.lang == 'English'
            ? "The characteristic symptom of yellow rust is of parallel rows of yellowish orange coloured pustules on the leaves of adult plants. Epidemics of yellow rust often start as individual plants, usually in the autumn. Symptoms develop slowly over winter and are often missed until the early spring when small patches or foci of infected plants can be seen in fields. These patches usually spread in the direction of prevailing wind."
            : "पिवळ्या गंजाचे वैशिष्ट्यपूर्ण लक्षण म्हणजे प्रौढ वनस्पतींच्या पानांवर पिवळसर केशरी रंगाच्या पुसट्यांच्या समांतर पंक्ती. पिवळ्या गंजची महामारी सहसा वैयक्तिक वनस्पती म्हणून सुरू होते, सहसा शरद ऋतूतील. हिवाळ्यात लक्षणे हळूहळू विकसित होतात आणि बहुतेकदा लवकर वसंत ऋतूपर्यंत चुकतात जेव्हा लहान ठिपके किंवा संक्रमित वनस्पतींचे केंद्र शेतात दिसू शकते. हे पॅचेस सहसा प्रचलित वाऱ्याच्या दिशेने पसरतात.";
        break;
      case 'Wheat___Brown_Rust':
        precautions = widget.lang == 'English'
            ? "Plant breeders have tried to improve yield quantities in crops like wheat from the earliest times In recent years, breeding for resistance against disease proved to be as important for total wheat production as breeding for increase in yield. The use of a single resistance gene against various pests and diseases plays a major role in resistance breeding for cultivated crops."
            : "वनस्पती प्रजननकर्त्यांनी सुरुवातीच्या काळापासून गव्हासारख्या पिकांमध्ये उत्पादनाचे प्रमाण सुधारण्याचा प्रयत्न केला आहे.[केव्हा?] अलिकडच्या वर्षांत, [केव्हा?] रोगाच्या प्रतिकारासाठी प्रजनन हे एकूण गहू उत्पादनासाठी उत्पादन वाढीसाठी प्रजननाइतकेच महत्त्वाचे असल्याचे सिद्ध झाले आहे. विविध कीटक आणि रोगांविरूद्ध एकाच प्रतिकार जनुकाचा वापर लागवड केलेल्या पिकांच्या प्रतिकार प्रजननामध्ये मोठी भूमिका बजावते. पिवळ्या गंजाच्या विरूद्ध प्रभावी म्हणून सर्वात जुने एकल प्रतिरोधक जनुक ओळखले गेले. पानांच्या गंज प्रतिकारासाठी असंख्य एकल जीन्स तेव्हापासून ओळखल्या गेल्या आहेत.";
        break;
      case 'Wheat_Septoria':
        precautions = widget.lang == 'English'
            ? "Septoria often results in elongated, oval septoria lesions that are restricted by leaf veins, giving a rectangular appearance. Water-soaked patches often form, surrounded by leaf yellowing or death. Lesions may coalesce to form large areas of necrotic brown tissue."
            : "सेप्टोरियाचा परिणाम बहुतेक वेळा लांबलचक, अंडाकृती सेप्टोरियाच्या जखमांमध्ये होतो जो पानांच्या नसांद्वारे प्रतिबंधित असतो, ज्यामुळे आयताकृती देखावा येतो. पाण्याने भिजलेले ठिपके अनेकदा तयार होतात, पान पिवळसर किंवा मृत्यूने वेढलेले असते. नेक्रोटिक ब्राऊन टिश्यूचे मोठे क्षेत्र तयार करण्यासाठी घाव एकत्र येऊ शकतात.";
        break;
      case 'Soybean__bacterial_blight':
        precautions = widget.lang == 'English'
            ? "Plants can be infected at any time during the growing season. Cool, wet weather and rain storms favor disease development. Disease progress stops in dry, hot conditions. Plant resistant soybean varieties and rotate with non-host crops. Always use pathogen-free seed. Field cultivation should be avoided when the foliage is wet. Deep tillage may help in the rare fields where this disease is frequently severe."
            : "वाढत्या हंगामात झाडांना कधीही संसर्ग होऊ शकतो. थंड, ओले हवामान आणि पावसाची वादळे रोगाच्या विकासास अनुकूल असतात. कोरड्या, उष्ण परिस्थितीत रोगाची प्रगती थांबते. प्रतिरोधक सोयाबीनच्या जाती लावा आणि यजमान नसलेल्या पिकांसह फिरवा. नेहमी रोगजनक नसलेले बियाणे वापरावे. झाडाची पाने ओली असताना शेतात मशागत करणे टाळावे. दुर्मिळ शेतात जेथे हा रोग वारंवार तीव्र असतो तेथे खोल मशागत मदत करू शकते.";
        break;
      case 'Soybean__caterpillar':
        precautions = widget.lang == 'English'
            ? "Thistle caterpillar is a sporadic pest of soybean. Caterpillars feed on leaves causing defoliation in the upper canopy of the soybean plant. Several foliar insecticides labelled on soybeans have activity against these and other caterpillars."
            : "सोयाबीनवरील तुरळक कीड आहे. सुरवंट पानांवर खातात, ज्यामुळे सोयाबीनच्या वरच्या छतातील पानांचे विघटन होते. सोयाबीनवर लेबल केलेल्या अनेक पर्णासंबंधी कीटकनाशके या आणि इतर सुरवंटांविरुद्ध क्रिया करतात";
        break;
      case 'Soybean__diabrotica_speciosa':
        precautions = widget.lang == 'English'
            ? "D speciosa can move locally by adult flight, and by movement of eggs, larvae or pupae in soil contaminating vehicles or farm machinery. Intensive use of products is required to control larvae in soil.  rotation of soybeans with maize or wheat, and use of insecticides only when damage is evident. Using this system, wheat is produced with virtually no pesticides in this area."
            : "डी. स्पेसिओसा प्रौढांच्या उड्डाणाने स्थानिक पातळीवर जाऊ शकतो आणि जमिनीतील अंडी, अळ्या किंवा प्युपा यांच्या हालचालींमुळे वाहने किंवा शेतातील यंत्रे दूषित होतात जमिनीतील अळ्या नियंत्रित करण्यासाठी उत्पादनांचा सखोल वापर करणे आवश्यक आहे. मका किंवा गहू सह सोयाबीन फिरवणे, आणि नुकसान स्पष्ट असतानाच कीटकनाशकांचा वापर. या प्रणालीचा वापर करून, या भागात अक्षरशः कोणत्याही कीटकनाशकांशिवाय गव्हाचे उत्पादन केले जाते.";
        break;
      case 'Soybean__downy_mildew':
        precautions = widget.lang == 'English'
            ? "often be found in most soybean production fields each year. Symptoms include pale green to bright yellow spots appearing first, which will eventually become necrotic spots. Downy mildew can occur on plants of all ages, although the disease is most common after flowering begins. Young leaves are most susceptible and infected leaves are often seen on the tops of plants. Dew and high humidity favor disease development, as well as mild temperatures. Select resistant soybean varieties and use appropriate seed treatments. Bury infested residue where feasible and where disease has been severe. Rotate soybeans with a non-bean crop for at least one year."
            : "दरवर्षी बहुतेक सोयाबीन उत्पादन क्षेत्रात आढळतात. लक्षणांमध्ये फिकट हिरवे ते चमकदार पिवळे ठिपके प्रथम दिसतात, जे कालांतराने नेक्रोटिक स्पॉट्स बनतात. डाऊनी बुरशी सर्व वयोगटातील झाडांवर येऊ शकते, जरी फुलांच्या सुरुवातीनंतर हा रोग सर्वात सामान्य आहे. कोवळी पाने जास्त संवेदनाक्षम असतात आणि संक्रमित पाने बहुतेक वेळा झाडांच्या वर दिसतात. दव आणि उच्च आर्द्रता रोगाच्या विकासास, तसेच सौम्य तापमानास अनुकूल करते. सोयाबीनचे प्रतिरोधक वाण निवडा आणि योग्य बीजप्रक्रिया वापरा. जिथे शक्य असेल आणि जिथे रोग गंभीर असेल तिथे बाधित अवशेष गाडून टाका. सोयाबीन बीन नसलेल्या पिकासह किमान एक वर्ष फिरवा. ";
        break;
      case 'Soybean__mosaic_virus':
        precautions = widget.lang == 'English'
            ? "Most varieties will be stunted and have fewer pods. Trifoliate leaves will have a mosaic of light and dark green areas that may become blistered or raised with time. Leaves may appear distorted, generally with the leaf margins curling downward. Symptoms are most severe during cool weather and infection is rarely evident during Nebraska summers. use of virus free seed and avoiding late planting of soybean to minimize aphid transmission."
            : "बहुतेक जाती खुंटलेल्या असतील आणि कमी शेंगा असतील. ट्रायफोलिएट पानांवर हलके आणि गडद हिरव्या भागाचे मोज़ेक असते जे कालांतराने फोड किंवा वाढू शकतात. पाने विकृत दिसू शकतात, सामान्यत: पानांचा मार्जिन खालच्या दिशेने वळलेला असतो. थंड हवामानात लक्षणे सर्वात गंभीर असतात आणि नेब्रास्का उन्हाळ्यात संसर्ग क्वचितच दिसून येतो. विषाणूमुक्त बियाणे वापरणे आणि ऍफिडचा प्रसार कमी करण्यासाठी सोयाबीनची उशीरा लागवड टाळणे.";
        break;
      case 'Soybean__powdery_mildew':
        precautions = widget.lang == 'English'
            ? "Infected leaves have white to light grey, powdery patches.  infected leaves tend to be most common on the lower and middle leaves . Leaves on susceptible varieties may turn yellow, then brown, and fall from the plant. Use varieties that are have low susceptibility to powdery mildew. Foliar fungicides can help to manage this disease, but are not usually recommended because powdery mildew rarely appears to causes yield loss"
            : "संक्रमित पानांवर पांढरे ते हलके राखाडी, पावडर ठिपके असतात. संक्रमित पाने खालच्या आणि मधल्या पानांवर जास्त प्रमाणात आढळतात. संवेदनाक्षम जातींवरील पाने पिवळी, नंतर तपकिरी होऊ शकतात आणि झाडापासून पडतात. पावडर बुरशीची कमी संवेदनशीलता असलेल्या वाणांचा वापर करा. पर्णासंबंधी बुरशीनाशके या रोगाचे व्यवस्थापन करण्यास मदत करू शकतात, परंतु सहसा शिफारस केली जात नाही कारण पावडर बुरशीमुळे क्वचितच उत्पन्नाचे नुकसान होते.";
        break;
      case 'Soybean__rust':
        precautions = widget.lang == 'English'
            ? "At the early stage of Asian Soybean Rust, it causes yellow mosaic discoloration on the upper surfaces of older foliage. At this stage, it is usually hard to identify since the symptoms are relatively small and poorly defined. using fungicides as protective sprays—are the main effective disease control method. Soybean rust must be managed as early in the growing season as possible to be managed successfully."
            : "आशियाई सोयाबीन रस्टच्या सुरुवातीच्या टप्प्यावर, ते जुन्या पर्णसंभाराच्या वरच्या पृष्ठभागावर पिवळे मोज़ेक विकृत करते. या टप्प्यावर, लक्षणे तुलनेने लहान आणि खराब परिभाषित असल्याने ओळखणे कठीण असते. संरक्षणात्मक फवारण्या म्हणून बुरशीनाशकांचा वापर करणे ही मुख्य प्रभावी रोग नियंत्रण पद्धत आहे. सोयाबीन गंज यशस्वीरित्या व्यवस्थापित करण्यासाठी वाढत्या हंगामात शक्य तितक्या लवकर व्यवस्थापित करणे आवश्यक आहे.";
        break;
      case 'Soybean__southern_blight':
        precautions = widget.lang == 'English'
            ? "Symptoms can occur at any time during the season from seedlings to mature plants. The disease generally is most visible in plants during mid-reproductive stages. Seedling infection results in pre- or post-emergence damping-off. Later in the season, entire plants may become yellow and wilt, with leaves turning brown and often remaining attached to the plant. Crop rotation with corn, grain sorghum, or wheat for 2 years can be beneficial at reducing survival and buildup of sclerotia in the soil. Deep cultivation to bury sclerotia in the soil reduces sclerotia longevity, and may be an option in certain farming systems."
            : "रोगाची लक्षणे रोपांपासून प्रौढ रोपांपर्यंत हंगामात कधीही येऊ शकतात. हा रोग सामान्यतः मध्य-प्रजनन अवस्थेत वनस्पतींमध्ये दिसून येतो. बीपासून नुकतेच तयार झालेले रोप संक्रमण पूर्व किंवा उगवल्यानंतर ओलसर होते. नंतरच्या हंगामात, संपूर्ण झाडे पिवळी आणि कोमेजून जातात, पाने तपकिरी होतात आणि बहुतेकदा झाडाला चिकटलेली राहतात. मका, धान्य ज्वारी किंवा गहू सोबत पीक 2 वर्षे फिरवणे हे जमिनीतील स्क्लेरोटीयाचे अस्तित्व कमी करण्यासाठी आणि जमा होण्यास फायदेशीर ठरू शकते. स्क्लेरोटीया जमिनीत पुरण्यासाठी खोल मशागत केल्याने स्क्लेरोटीयाचे दीर्घायुष्य कमी होते आणि काही विशिष्ट शेती पद्धतींमध्ये हा पर्याय असू शकतो.";
        break;
      case 'Sugarcane__bacterial_blight':
        precautions = widget.lang == 'English'
            ? "The disease occurs mostly on young and middle-aged leaves. Long, narrow, uniform and watery-green stripes occur first near the midrib and the base of leaf blades. At later stages of the disease, stripes spread across the whole leaf, coalesce and become first light and then dark-red in colour. Always consider an integrated approach with preventive measures together with biological treatments if available To avoid primary infection treatment of the seeds with the appropriate fungicide for 15 to 20 minutes could be conducted."
            : "हा रोग प्रामुख्याने कोवळ्या आणि मध्यम वयाच्या पानांवर होतो. लांब, अरुंद, एकसमान आणि पाणचट-हिरव्या पट्टे आधी मिड्रिबजवळ आणि पानांच्या ब्लेडच्या पायाजवळ आढळतात. रोगाच्या नंतरच्या टप्प्यावर, पट्टे संपूर्ण पानावर पसरतात, एकत्र होतात आणि प्रथम हलके आणि नंतर गडद-लाल रंगाचे होतात. उपलब्ध असल्यास जैविक उपचारांसह प्रतिबंधात्मक उपायांसह एकात्मिक पध्दतीचा नेहमी विचार करा, प्राथमिक संसर्ग टाळण्यासाठी 15 ते 20 मिनिटे योग्य बुरशीनाशकासह बियाण्यांवर प्राथमिक उपचार केले जाऊ शकतात.";
        break;
      case 'Sugarcane__red_rot':
        precautions = widget.lang == 'English'
            ? "The affected canes exhibit leaf colour change, from green to orange and then to yellow in the third or fourth leaf. Then the leaves start drying from bottom to top.If the fungal spores enter the leaf sheath through the leaf midrib, then reddish spots can be seen on the back side of the leaf midrib also. The red rot affected field must be rotated with rice for one season and other crops for two seasons. If the disease is noticed in the field, the leaves and canes should be collected and destroyed by burning. Use fungitoxic chemicals like Bavistan, Benomyl, Topsin and Aretan at 0.1 per cent for 18 min. at 52ºC for dipping setts which gave almost complete elimination of rot infection."
            : "प्रभावित ऊस पानांचा रंग बदलून हिरवा ते केशरी आणि नंतर तिसर्‍या किंवा चौथ्या पानात पिवळा होतो. नंतर पाने खालपासून वरपर्यंत सुकायला लागतात. जर बुरशीचे बीजाणू पानाच्या मध्यभागातून पानाच्या आवरणात शिरले, तर पानाच्या मध्यभागी देखील लालसर ठिपके दिसू शकतात. लाल कुजलेल्या शेतात भात एका हंगामासाठी आणि इतर पिके दोन हंगामात फिरवावीत. शेतात हा रोग निदर्शनास आल्यास पाने व बेणे गोळा करून जाळून नष्ट करावेत. बाविस्तान, बेनोमिल, टॉपसिन आणि अरेटान सारखी बुरशीजन्य रसायने 0.1 टक्के 18 मिनिटांसाठी वापरा. डिपिंग सेट्ससाठी 52ºC वर, ज्यामुळे रॉट संसर्ग जवळजवळ पूर्णपणे नष्ट झाला.";
        break;
      case 'Sugarcane__red_stripe':
        precautions = widget.lang == 'English'
            ? "Red stripe is characterized by the appearance on the leaves of chlorotic lesions carrying dark red stripes 0.5-1.0 mm in breadth and several mm in length, either distributed all over the blade, or concentrated in the middle Several of them may coalesce to cover large areas of the leaf blade, and to cause wilting and drying of the leaves.  Uprooting and burning of infected sugarcane plants may help reduce the disease incidence. Setts selection should be done with care so that only healthy setts can be sown in the field."
            : "लाल पट्ट्याचे वैशिष्ट्य म्हणजे क्लोरोटिक जखमांच्या पानांवर गडद लाल पट्टे 0.5-1.0 मिमी रुंदीचे आणि अनेक मिमी लांबीचे, एकतर संपूर्ण ब्लेडवर वितरित केले जातात किंवा मध्यभागी केंद्रित असतात. त्‍यातील अनेक पानांचे मोठे भाग झाकण्‍यासाठी एकत्र होतात आणि पानांना कोमेजतात आणि कोरडे करतात. संक्रमित उसाची झाडे उपटून जाळल्याने रोगाचा प्रादुर्भाव कमी होण्यास मदत होते. सेट्सची निवड काळजीपूर्वक करावी जेणेकरून शेतात फक्त निरोगी सेट्स पेरता येतील.";
        break;
      case 'Sugarcane__rust':
        precautions = widget.lang == 'English'
            ? "The initial symptoms of sugarcane common rust are elongated yellowish leaf spots, of about 1-4 mm length. They also turn into orange-brown or red-brown flecks with a slight but definite chlorotic halo. The best means of control for sugarcane rust is to grow resistant varieties. chemical control of sugarcane rust does not offer enough economic return to be used at present. Since soil factors have been identified as being associated with rust infection levels on sugarcane, avoid growing susceptible varieties in areas with low soil pH."
            : "उसाच्या सामान्य गंजाची सुरुवातीची लक्षणे म्हणजे पानावर 1-4 मिमी लांबीचे लांबलचक पिवळसर ठिपके असतात. ते नारिंगी-तपकिरी किंवा लाल-तपकिरी पिसांमध्ये थोडेसे परंतु निश्चित क्लोरोटिक हेलोसह बदलतात. उसाच्या गंजावर नियंत्रण ठेवण्याचे उत्तम साधन म्हणजे प्रतिरोधक वाणांची लागवड करणे. उसाच्या गंजाचे रासायनिक नियंत्रण सध्या वापरण्याइतपत आर्थिक परतावा देत नाही. मातीचे घटक ऊसावरील गंज संक्रमण पातळीशी संबंधित असल्याचे ओळखले जात असल्याने, कमी माती pH असलेल्या भागात संवेदनाक्षम वाण वाढवणे टाळा.";
        break;
      case 'Cassava__bacterial_blight':
        precautions = widget.lang == 'English'
            ? " In cassava, symptoms vary in a manner that is unique to this pathogen. Symptoms include blight, wilting, dieback, and vascular necrosis. A more diagnostic symptom visible in cassava with X. axonopodis infection is angular necrotic spotting of the leaves, often with a chlorotic ring encircling the spots. These spots begin as distinguishable moist, brown lesions normally restricted to the bottom of the plant until they enlarge and coalesce, often killing the entire leaf.  Pruning or total extirpation of infected plant tissue, weed removal, use of certified seeds, bacterial analysis of stem cuttings and crop rotation are used the most to limit the disease presence in the field."
            : "कसावामध्ये, लक्षणे या रोगजनकाच्या विशिष्ट पद्धतीने बदलतात. लक्षणांमध्ये ब्लाइट, विल्टिंग, डायबॅक आणि व्हॅस्क्युलर नेक्रोसिस यांचा समावेश होतो. X. axonopodis संसर्गासह कसावामध्ये दिसणारे अधिक निदानात्मक लक्षण म्हणजे पानांवर कोनीय नेक्रोटिक स्पॉटिंग, बहुतेकदा स्पॉट्सभोवती क्लोरोटिक रिंग असते. हे ठिपके वेगळे ओळखता येण्याजोगे ओलसर, तपकिरी घाव म्हणून सुरू होतात जोपर्यंत ते मोठे होत नाहीत आणि एकत्र येईपर्यंत झाडाच्या तळापर्यंत मर्यादित असतात, बहुतेक वेळा संपूर्ण पान मरतात. रोपांची छाटणी किंवा संक्रमित ऊतींचे संपूर्ण उत्खनन, तण काढून टाकणे, प्रमाणित बियाणे वापरणे, स्टेम कटिंग्जचे जिवाणू विश्लेषण आणि पीक रोटेशनचा वापर शेतात रोगाची उपस्थिती मर्यादित करण्यासाठी सर्वात जास्त केला जातो.";
        break;
      case 'Cassava__brown_streak':
        precautions = widget.lang == 'English'
            ? "Brown streaks may appear on the stems of the cassava plant. Also, a dry brown-black necrotic rot of the cassava tuber exists, which may progress from a small lesion to the whole root. Finally, the roots can become constricted due to the tuber rot, stunting growth. Widespread distribution of germplasm of these varieties can reduce disease incidence on a large scale. Furthermore, screening for resistance in farmer-preferred cassava genotypes is crucial for effective for management."
            : "कसावा वनस्पतीच्या देठावर तपकिरी रेषा दिसू शकतात. तसेच, कसावा कंदाचा कोरडा तपकिरी-काळा नेक्रोटिक रॉट अस्तित्वात आहे, जो लहान जखमांपासून संपूर्ण मुळापर्यंत वाढू शकतो. शेवटी, कंद कुजणे, वाढ खुंटणे यामुळे मुळे संकुचित होऊ शकतात. या जातींच्या जर्मप्लाझमचे व्यापक वितरण केल्यास रोगाचा प्रादुर्भाव मोठ्या प्रमाणावर कमी होऊ शकतो. शिवाय, व्यवस्थापनासाठी प्रभावी होण्यासाठी शेतकरी-प्राधान्य असलेल्या कसावा जीनोटाइपमधील प्रतिकारासाठी स्क्रीनिंग महत्त्वपूर्ण आहे.";
        break;
      case 'Cassava__green_mottle':
        precautions = widget.lang == 'English'
            ? "Young leaves are puckered with faint to distinct yellow spots, green patterns (mosaics), and twisted margins Usually, the shoots recover from symptoms and appear healthy. Occasionally, plants become severely stunted, edible roots are absent or, if present, they are small and woody when cooked."
            : "कोवळ्या पानांवर अस्पष्ट ते वेगळे पिवळे ठिपके, हिरवे नमुने (मोज़ेक) आणि वळणावळणाच्या मार्जिनने पुसले जाते, सहसा, कोंब लक्षणांपासून बरे होतात आणि निरोगी दिसतात. कधीकधी, झाडे गंभीरपणे खुंटतात, खाण्यायोग्य मुळे अनुपस्थित असतात .";
        break;
      case 'Cassava__mosaic_disease':
        precautions = widget.lang == 'English'
            ? " Mosaic symptom, reduction in leaf size, misshapened twisted leaves.The affected plants stunted, tuber splitting and yield reduction.The virus spreads by infected setts and whitefly Bemisia tabaci.\n\n These are some management\n •	Selection of setts from healthy plants•	Rouging infected plants in the field at early stage\n	Management of whitefly by installing yellow sticky traps, removal of weed hosts, spray neem oil 3% or Methyl dematon @ 2ml/lit.\n"
            : "मोझॅकचे लक्षण, पानांचा आकार कमी होणे, वळलेली पाने चुकणे. प्रभावित झाडे खुंटणे, कंद फुटणे आणि उत्पादनात घट. हा विषाणू संक्रमित सेट्स आणि पांढरी माशी बेमिसिया टॅबसी द्वारे पसरतो.\nहे काही व्यवस्थापन आहेत\n\nनिरोगी वनस्पतींपासून संचांची निवड• प्रादुर्भावग्रस्त झाडांना सुरुवातीच्या अवस्थेत शेतात रुजवा\n• पांढर्‍या माशीचे व्यवस्थापन पिवळे चिकट सापळे लावून, तण काढणे, निंबोळी तेल 3% किंवा मिथाइल डिमॅटॉन @ 2ml/लिटर फवारणीकरणे.";
        break;
    }
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(126, 217, 87, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                widget.lang == 'English' ? "Result" : "परिणाम",
                style: widget.lang == 'English'
                    ? TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)
                    : DevanagariFonts.hind(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.lang == 'English'
                    ? "Predict Disease"
                    : "रोगाचा अंदाज लावा",
                style: widget.lang == 'English'
                    ? TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)
                    : DevanagariFonts.hind(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
              ),
              SizedBox(
                height: 25,
              ),
              Image.file(widget.image),
              SizedBox(
                height: 25,
              ),
              Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.lang == 'English'
                              ? "Predicted Disease:- "
                              : "निष्कर्ष",
                          style: widget.lang == 'English'
                              ? TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)
                              : DevanagariFonts.hind(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                        Text(
                          widget.lang == 'English'
                              ?widget.result.toString():widget.nameinM,
                          style:widget.lang == 'English'? TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold):DevanagariFonts.hind(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.lang == 'English'
                              ? "Description"
                              : "सविस्तर माहिती",
                          style: widget.lang == 'English'
                              ? TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)
                              : DevanagariFonts.hind(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          precautions.toString(),
                          style: widget.lang == 'English'
                              ? TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)
                              : DevanagariFonts.hind(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search(url: 'https://www.google.com/search?q=nearby+pesticide&rlz=1C1ONGR_enIN1013IN1013&oq=nearby+pesticide&aqs=chrome..69i57j0i13i512j0i390l4.21547j1j7&sourceid=chrome&ie=UTF-8',)));
                  },
                  child: Text("Nearby Pesticide"))
            ],
          ),
        ),
      ),
    );
  }
}
