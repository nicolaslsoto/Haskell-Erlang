-- $Id: Relations.hs,v 1.3 2019/09/11 13:01:08 leavens Exp leavens $
module Relations where
import BinaryRelation
bar_stuff :: BinaryRelation String String
us_cities :: BinaryRelation String String
city_country :: BinaryRelation String String
city_population :: BinaryRelation String Int
city_areakm2 :: BinaryRelation String Int
country_population :: BinaryRelation String Int
bar_stuff = [("bar","mitzva"),("bar","stool"), ("bar","tender"),("salad","bar"),("bar","keeper")]
us_cities = [("Chicago","Illinois"),("Miami","Florida"),("Ames","Iowa")
            ,("Orlando","Florida"),("Des Moines","Iowa")]
-- The following data are from Wikipedia.org, accessed August 19, 2013
city_country =
    [("Beijing","China"),("Buenos Aires","Argentina"),("Cairo","Egypt"),("Delhi","India")
    ,("Dhaka","Bangladesh"),("Guangzhou","China"),("Istanbul","Turkey"),("Jakarta","Indonesia")
    ,("Karachi","Pakistan"),("Kinshasa","Democratic Republic of the Congo"),("Kolkata","India")
    ,("Lagos","Nigeria"),("Lima","Peru"),("London","United Kingdom"),("Los Angeles","United States")
    ,("Manila","Philippines"),("Mexico City","Mexico"),("Moscow","Russia"),("Mumbai","India")
    ,("New York City","United States"),("Osaka","Japan"),("Rio de Janeiro","Brazil")
    ,("Sao Paulo","Brazil"),("Seoul","South Korea"),("Shanghai","China"),("Shenzhen","China")
    ,("Tehran","Iran"),("Tianjin","China"),("Tokyo","Japan")]
city_population =
   [("Tokyo", 37239000),("Jakarta", 26746000),("Seoul", 22868000)
   ,("Delhi", 22826000),("Shanghai", 21766000),("Manila", 21241000)
   ,("Karachi", 20877000),("New York City", 20673000),("Sao Paulo", 20568000)
   ,("Mexico City", 20032000),("Beijing", 18241000),("Guangzhou", 17681000)
   ,("Mumbai", 17307000),("Osaka", 17175000),("Moscow", 15788000)
   ,("Cairo", 15071000),("Los Angeles", 15067000),("Kolkata", 14399000)
   ,("Buenos Aires", 13776000),("Tehran", 13309000),("Istanbul", 12506000)
   ,("Lagos", 12090000),("Rio", 10183000),("London", 9576000)
   ,("Lima", 9400000),("Kinshasa", 9387000),("Tianjin", 9277000)
   ,("Chennai", 9182000),("Chicago", 9104000),("Bengaluru", 9044000)
   ,("Bogota", 9009000)]
city_areakm2 = -- area is measured in square km
    [("Tokyo", 8547) ,("Jakarta", 2784) ,("Seoul", 2163)
    ,("Delhi", 1943) ,("Shanghai", 3497) ,("Manila", 1437)
    ,("Karachi", 803) ,("New York City", 11642) ,("Sao Paulo", 3173)
    ,("Mexico City", 2046) ,("Beijing", 3497) ,("Guangzhou", 3173)
    ,("Mumbai", 546) ,("Osaka", 3212) ,("Moscow", 4403)
    ,("Cairo", 1658) ,("Los Angeles", 6299) ,("Kolkata", 1204)
    ,("Bangkok", 2331) ,("Dhaka", 324) ,("Buenos Aires", 2642)
    ,("Tehran", 1360) ,("Istanbul", 1347) ,("Shenzhen", 1748)
    ,("Lagos", 907) ,("Rio de Janeiro", 2020) ,("Paris", 2845)
    ,("Nagoya", 3820) ,("London", 1623) ,("Lima", 648)
    ,("Kinshasa", 583) ,("Tianjin", 1684) ,("Chennai", 842)
    ,("Chicago", 6856) ,("Bengaluru", 738) ,("Bogota", 414)]
country_population = -- from Wikipedia.org access August 21, 2013
    [("China",1359470000),("India",1232830000),("United States",316497000),("Indonesia",237641326)
    ,("Brazil",193946886),("Pakistan",184013000),("Nigeria",173615000),("Bangladesh",152518015)
    ,("Russia",143400000),("Japan",127350000),("Mexico",117409830),("Philippines",98234000)]
