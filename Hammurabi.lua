-- 10 REM *** CONVERTED FROM THE ORIGINAL FOCAL PROGRAM AND MODIFIED
-- 20 REM *** FOR EDUSYSTEM 70 BY DAVID AHL, DIGITAL
-- 30 REM *** MODIFIED FOR 8K MICROSOFT BASIC BY PETER TURNBULL

local function f710(s)
    -- 710 PRINT "HAMURABI:  THINK AGAIN. YOU HAVE ONLY"
        print("HAMURABI:  THINK AGAIN. YOU HAVE ONLY")
    
    -- 711 PRINT S"BUSHELS OF GRAIN.  NOW THEN,"
        print(s, "BUSHELS OF GRAIN.  NOW THEN,")
    end
    local function f720(a)
    -- 720 PRINT "HAMURABI:  THINK AGAIN. YOU OWN ONLY"A"ACRES.  NOW THEN,"
        print("HAMURABI:  THINK AGAIN. YOU OWN ONLY", a, "ACRES.  NOW THEN,")
    end
    
    local function f800()
    -- 800 C=INT(RND(1)*5)+1
        return math.floor(math.random() * 5) + 1
    end
    
    
-- 80 PRINT "TRY YOUR HAND AT GOVERNING ANCIENT SUMERIA"0

print("TRY YOUR HAND AT GOVERNING ANCIENT SUMERIA")
-- $OutputEncoding = [System.Console]::OutputEncoding = [System.Console]::InputEncoding = [System.Text.Encoding]::UTF8
-- print("Попробуй взять в свои руки управление Древней Шумерией")

-- 85 PRINT "SUCCESSFULLY FOR A 10-YR TERM OF OFFICE.":PRINT
print("SUCCESSFULLY FOR A 10-YR TERM OF OFFICE.")

-- 90 REM RANDOMIZE REMOVED
-- 95 D1=0:P1=0
local D1_died_people = 0
local p1 = 0

-- 110 Z=0:P=95:S=2800:H=3000:E=H-S
local Z_year = 0
local P_population = 95
local S_stored_bushels = 2800
local H_harvest = 3000
local E_eaten_bushels = H_harvest - S_stored_bushels

-- 120 Y=3:A=H/Y:I=5:Q=1
local Y_yield = 3
local A_area = math.floor(H_harvest / Y_yield)
local I_income_people = 5
local Q_buy_acres = 1

-- 210 D=0
::L210:: local D_seed_acres = 0

-- 215 PRINT:PRINT:PRINT "HAMURABI:  I BEG TO REPORT TO YOU,":Z=Z+1
::L215:: print("")
print("")
print("HAMURABI:  I BEG TO REPORT TO YOU,")
Z_year = Z_year + 1

-- 217 PRINT "IN YEAR"Z","D"PEOPLE STARVED,"I"CAME TO THE CITY."
print("IN YEAR",Z_year, ",", D_seed_acres, "PEOPLE STARVED,", I_income_people, "CAME TO THE CITY.")

-- 218 P=P+I
P_population = P_population + I_income_people

-- 227 IF Q>0 THEN 230
if Q_buy_acres > 0 then goto L230 end

-- 228 P=INT(P/2)
P_population = math.floor(P_population / 2)

-- 229 PRINT "A HORRIBLE PLAGUE STRUCK!  HALF THE PEOPLE DIED."
print("A HORRIBLE PLAGUE STRUCK!  HALF THE PEOPLE DIED.")

-- 230 PRINT "POPULATION IS NOW"P 
::L230:: print("POPULATION IS NOW", P_population)

-- 232 PRINT "THE CITY NOW OWNS"A"ACRES."
print("THE CITY NOW OWNS", A_area, "ACRES.")

-- 235 PRINT "YOU HARVESTED"Y"BUSHELS PER ACRE."
print("YOU HARVESTED", Y_yield, "BUSHELS PER ACRE.")

-- 250 PRINT "RATS ATE"E"BUSHELS."
print("RATS ATE", E_eaten_bushels, "BUSHELS.")

-- 260 PRINT "YOU NOW HAVE"S"BUSHELS IN STORE.":PRINT
print("YOU NOW HAVE", S_stored_bushels, "BUSHELS IN STORE.")
print("")

-- 270 IF Z=11 THEN 860
if Z_year == 11 then goto L860 end

-- 310 C=INT(10*RND(1)):Y=C+17
C_area_price_coeff = math.floor(10 * math.random())
Y_yield = C_area_price_coeff + 17

-- 312 PRINT "LAND IS TRADING AT"Y"BUSHELS PER ACRE."
print("LAND IS TRADING AT", Y_yield, "BUSHELS PER ACRE.")

-- 320 PRINT "HOW MANY ACRES DO YOU WISH TO BUY";
::L320:: print("HOW MANY ACRES DO YOU WISH TO BUY?")

-- 321 INPUT Q:IF Q<0 THEN 850
Q_buy_acres = io.read("*n") -- read a number
if Q_buy_acres < 0 then goto L850 end

-- 322 IF Y*Q<=S THEN 330
if Y_yield * Q_buy_acres <= S_stored_bushels then goto L330 end

-- 323 GOSUB 710
f710(S_stored_bushels)

-- 324 GOTO 320 
goto L320

-- 330 IF Q=0 THEN 340
::L330:: if Q_buy_acres == 0 then goto L340 end

-- 331 A=A+Q:S=S-Y*Q:C=0
A_area = A_area + Q_buy_acres
S_stored_bushels = S_stored_bushels - Y_yield * Q_buy_acres
C_area_price_coeff = 0

-- 334 GOTO 400
goto L400

-- 340 PRINT "HOW MANY ACRES DO YOU WISH TO SELL";
::L340:: print("HOW MANY ACRES DO YOU WISH TO SELL?")

-- 341 INPUT Q:IF Q<0 THEN 850
Q_buy_acres = io.read("*n") -- read a number
if Q_buy_acres < 0 then goto L850 end

-- 342 IF Q<A THEN 350
if Q_buy_acres < A_area then goto L350 end
    
-- 343 GOSUB 720
f720(A_area)

-- 344 GOTO 340 
goto L340

-- 350 A=A-Q:S=S+Y*Q:C=0
::L350:: A_area = A_area - Q_buy_acres
S_stored_bushels = S_stored_bushels + Y_yield * Q_buy_acres
C_area_price_coeff = 0

-- 400 PRINT
::L400:: print("")

-- 410 PRINT "HOW MANY BUSHELS DO YOU WISH TO FEED YOUR PEOPLE";
::L410:: print("HOW MANY BUSHELS DO YOU WISH TO FEED YOUR PEOPLE?")

-- 411 INPUT Q
Q_buy_acres = io.read("*n") -- read a number

-- 412 IF Q<0 THEN 850
if Q_buy_acres < 0 then goto L850 end

-- 418 REM *** TRYING TO USE MORE GRAIN THAN IN THE SILOS?
-- 420 IF Q<=S THEN 430 
if Q_buy_acres <= S_stored_bushels then goto L430 end

-- 421 GOSUB 710
f710(S_stored_bushels)

-- 422 GOTO 410 
goto L410

-- 430 S=S-Q:C=1:PRINT
::L430:: S_stored_bushels = S_stored_bushels - Q_buy_acres
C_area_price_coeff = 1
print("")

-- 440 PRINT "HOW MANY ACRES DO YOU WISH TO PLANT WITH SEED";
::L440:: print("HOW MANY ACRES DO YOU WISH TO PLANT WITH SEED?")

-- 441 INPUT D:IF D=0 THEN 511
D_seed_acres = io.read("*n") -- read a number
if D_seed_acres == 0 then goto L511 end

-- 442 IF D<0 THEN 850
if D_seed_acres < 0 then goto L850 end

-- 444 REM *** TRYING TO PLANT MORE ACRES THAN YOU OWN?
-- 445 IF D<=A THEN 450
if D_seed_acres <= A_area then goto L450 end

-- 446 GOSUB 720
f720(A_area)

-- 447 GOTO 440
goto L440

-- 449 REM *** ENOUGH GRAIN FOR SEED?
-- 450 IF INT(D/2)<S THEN 455
::L450:: if math.floor(D_seed_acres / 2) < S_stored_bushels then goto L455 end

-- 452 GOSUB 710
f710(S_stored_bushels)

-- 453 GOTO 440 
goto L440

-- 454 REM *** ENOUGH PEOPLE TO TEND THE CROPS?
-- 455 IF D<10*P THEN 510
::L455:: if D_seed_acres < 10 * P_population then goto L510 end

-- 460 PRINT "BUT YOU HAVE ONLY"P"PEOPLE TO TEND THE FIELDS. NOW THEN,"
print("BUT YOU HAVE ONLY", P_population, "PEOPLE TO TEND THE FIELDS. NOW THEN,")

-- 470 GOTO 440
goto L440

-- 510 S=S-INT(D/2)
::L510:: S_stored_bushels = S_stored_bushels - math.floor(D_seed_acres / 2)

-- 511 GOSUB 800
::L511:: C_area_price_coeff = f800()

-- 512 REM *** A BOUNTYFULL HARVEST!!
-- 515 Y=C:H=D*Y:E=0
Y_yield = C_area_price_coeff;
H_harvest = D_seed_acres * Y_yield
E_eaten_bushels = 0

-- 521 GOSUB 800
C_area_price_coeff = f800()

-- 522 IF INT(C/2)<>C/2 THEN 530
if math.floor(C_area_price_coeff / 2) ~= C_area_price_coeff / 2 then goto L530 end

-- 523 REM *** THE RATS ARE RUNNING WILD!!
-- 525 E=INT(S/C)
E_eaten_bushels = math.floor(S_stored_bushels / C_area_price_coeff)

-- 530 S=S-E+H
::L530:: S_stored_bushels = S_stored_bushels - E_eaten_bushels + H_harvest

-- 531 GOSUB 800
C_area_price_coeff = f800()

-- 532 REM *** LET'S HAVE SOME BABIES
-- 533 I=INT(C*(20*A+S)/P/100+1)
I_income_people = math.floor(C_area_price_coeff * (20 * A_area + S_stored_bushels) / P_population / 100 + 1)

-- 539 REM *** HOW MANY PEOPLE HAD FULL TUMMIES?
-- 540 C=INT(Q/20)
C_area_price_coeff = math.floor(Q_buy_acres / 20)

-- 541 REM *** HORRORS, A 15% CHANCE OF PLAGUE
-- 542 Q=INT(10*(2*RND(1)-.3))
Q_buy_acres = math.floor(10 * (2 * math.random() - 0.3))

-- 550 IF P<C THEN 210
if P_population < C_area_price_coeff then goto L210 end

-- 551 REM *** STARVE ENOUGH FOR IMPEACHMENT?
-- 552 D=P-C:IF D>.45*P THEN 560
D_seed_acres = P_population - C_area_price_coeff
if D_seed_acres > 0.45 * P_population then goto L560 end

-- 553 P1=((Z-1)*P1+D*100/P)/Z
p1 = ((Z_year - 1) * p1 + D_seed_acres * 100 / P_population) / Z_year

-- 555 P=C:D1=D1+D:GOTO 215
P_population = C_area_price_coeff
D1_died_people = D1_died_people + D_seed_acres
goto L215

-- 560 PRINT:PRINT "YOU STARVED"D"PEOPLE IN ONE YEAR!!!"
::L560:: print("")
print("YOU STARVED", D_seed_acres, "PEOPLE IN ONE YEAR!!!")

-- 565 PRINT "DUE TO THIS EXTREME MISMANAGEMENT YOU HAVE NOT ONLY"
::L565:: print("DUE TO THIS EXTREME MISMANAGEMENT YOU HAVE NOT ONLY")

-- 566 PRINT "BEEN IMPEACHED AND THROWN OUT OF OFFICE BUT YOU HAVE"
print("BEEN IMPEACHED AND THROWN OUT OF OFFICE BUT YOU HAVE")

-- 567 PRINT "ALSO BEEN DECLARED 'NATIONAL FINK' !!":GOTO 990
print("ALSO BEEN DECLARED 'NATIONAL FINK' !!")
goto L990


-- 710 PRINT "HAMURABI:  THINK AGAIN. YOU HAVE ONLY"
-- 711 PRINT S"BUSHELS OF GRAIN.  NOW THEN,"
-- 712 RETURN 
-- local function f710(s)

-- 720 PRINT "HAMURABI:  THINK AGAIN. YOU OWN ONLY"A"ACRES.  NOW THEN,"
-- 730 RETURN
-- local function f720(a)

-- 800 C=INT(RND(1)*5)+1
-- 801 RETURN 
-- local function f800()

-- 850 PRINT:PRINT "HAMURABI:  I CANNOT DO WHAT YOU WISH."
::L850:: print("")
print("HAMURABI:  I CANNOT DO WHAT YOU WISH.")

-- 855 PRINT "GET YOURSELF ANOTHER STEWARD!!!!!"
print("GET YOURSELF ANOTHER STEWARD!!!!!")

-- 857 GOTO 990
goto L990

-- 860 PRINT "IN YOUR 10-YEAR TERM OF OFFICE,"P1"PERCENT OF THE"
::L860:: print("IN YOUR 10-YEAR TERM OF OFFICE,", p1, "PERCENT OF THE")

-- 862 PRINT "POPULATION STARVED PER YEAR ON AVERAGE, I.E., A TOTAL OF"
print("POPULATION STARVED PER YEAR ON AVERAGE, I.E., A TOTAL OF")

-- 865 PRINT D1"PEOPLE DIED!!":L=A/P
print(D1_died_people, "PEOPLE DIED!!")
L_person_acres = A_area / P_population

-- 870 PRINT "YOU STARTED WITH 10 ACRES PER PERSON AND ENDED WITH"
print("YOU STARTED WITH 10 ACRES PER PERSON AND ENDED WITH")

-- 875 PRINT L"ACRES PER PERSON.":PRINT
print(L_person_acres, "ACRES PER PERSON.")
print("")

-- 880 IF P1>33 THEN 565
if p1 > 33 then goto L565 end

-- 885 IF L<7 THEN 565
if L_person_acres < 7 then goto L565 end

-- 890 IF P1>10 THEN 940
if p1 > 10 then goto L940 end

-- 892 IF L<9 THEN 940
if L_person_acres < 9 then goto L940 end

-- 895 IF P1>3 THEN 960
if p1 > 3 then goto L960 end

-- 896 IF L<10 THEN 960
if L_person_acres < 10 then goto L960 end

-- 900 PRINT "A FANTASTIC PERFORMANCE!!!  CHARLEMANGE, DISRAELI, AND"
print("A FANTASTIC PERFORMANCE!!!  CHARLEMANGE, DISRAELI, AND")

-- 905 PRINT "JEFFERSON COMBINED COULD NOT HAVE DONE BETTER!":GOTO 990
print("JEFFERSON COMBINED COULD NOT HAVE DONE BETTER!")
goto L990

-- 940 PRINT "YOUR HEAVY-HANDED PERFORMANCE SMACKS OF NERO AND IVAN IV."
::L940:: print("YOUR HEAVY-HANDED PERFORMANCE SMACKS OF NERO AND IVAN IV.")

-- 945 PRINT "THE PEOPLE (REMAINING) FIND YOU AN UNPLEASANT RULER, AND,"
print("THE PEOPLE (REMAINING) FIND YOU AN UNPLEASANT RULER, AND,")

-- 950 PRINT "FRANKLY, HATE YOUR GUTS!":GOTO 990
print("FRANKLY, HATE YOUR GUTS!")
goto L990

-- 960 PRINT "YOUR PERFORMANCE COULD HAVE BEEN SOMEWHAT BETTER, BUT"
::L960:: print("YOUR PERFORMANCE COULD HAVE BEEN SOMEWHAT BETTER, BUT")

-- 965 PRINT "REALLY WASN'T TOO BAD AT ALL. ";
print("REALLY WASN'T TOO BAD AT ALL.")

-- 966 PRINT INT(P*.8*RND(1));"PEOPLE WOULD"
print(math.floor(P_population * 0.8 * math.random()), "PEOPLE WOULD")

-- 970 PRINT "DEARLY LIKE TO SEE YOU ASSASSINATED BUT WE ALL HAVE OUR"
print("DEARLY LIKE TO SEE YOU ASSASSINATED BUT WE ALL HAVE OUR")

-- 975 PRINT "TRIVIAL PROBLEMS."
print("TRIVIAL PROBLEMS.")

-- 990 PRINT:FOR N=1 TO 10:PRINT CHR$(7);:NEXT N
::L990::

-- 995 PRINT "SO LONG FOR NOW.":PRINT
print("SO LONG FOR NOW.")

-- 999 END

