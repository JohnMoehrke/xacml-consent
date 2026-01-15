Instance: Consent-AB352-Example
InstanceOf: Consent
Title: "AB352 Organizational Privacy Consent"
Description: "Consent representing AB352 regulatory basis and organizational XACML enforcement policy."
Usage: #example

* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category[0].coding[0].system = "http://loinc.org"
* category[0].coding[0].code = #64292-6
* category[0].coding[0].display = "Release of information consent"

* patient = Reference(http://example.org/Patient/example)
* dateTime = "2025-01-15T12:00:00Z"

* organization[0] = Reference(http://example.org/Organization/ca-hospital)
* organization[0].display = "Example California Hospital"

* policyRule.coding.system = "urn:ietf:rfc:3986"
* policyRule.coding.code = #urn:law:us:ca:statute:AB352
* policyRule.coding.display = "California AB 352"

* policy[0].authority = "https://example-hospital.org"
* policy[0].uri = "urn:org:hospital:policyset:AB352"

///////////////////////////////////////////////////////////////
// Top-level provision: permit treatment by in-state providers
///////////////////////////////////////////////////////////////

* provision[0].type = #permit

// Sensitivity classes (segmented categories)
* provision[0].securityLabel[+] = CS_Health_Sensitivity#ABORTION
* provision[0].securityLabel[+] = CS_Health_Sensitivity#GENDER_AFFIRMING_CARE
* provision[0].securityLabel[+] = CS_Health_Sensitivity#CONTRACEPTION
// Purpose of use: treatment
* provision[0].purpose = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT

// In-state provider actor
* provision[0].actor[0].role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP
* provision[0].actor[0].reference = Reference(http://example.org/Organization/ca-hospital)
* provision[0].actor[0].reference.display = "In-state (CA) providers"
///////////////////////////////////////////////////////////////
// Nested provision: deny disclosure to out-of-state recipients
///////////////////////////////////////////////////////////////

* provision[0].provision[0].type = #deny

* provision[0].provision[0].securityLabel[+] = CS_Health_Sensitivity#ABORTION
* provision[0].provision[0].securityLabel[+] = CS_Health_Sensitivity#GENDER_AFFIRMING_CARE
* provision[0].provision[0].securityLabel[+] = CS_Health_Sensitivity#CONTRACEPTION

// Out-of-state recipient  -- By NOT specifying a actor, we mean all other actors than the in-state provider above


CodeSystem: CS_Health_Sensitivity
Id: cs-health-sensitivity
Title: "Health Information Sensitivity Categories"
Description: """
Code system defining sensitivity categories for health information segmentation under California AB352.

Note did not use HL7 v2-ActCodes as two of the three categories are not represented there, and the GENDER code may be more broad than GENDER_AFFIRMING_CARE as intended here.
"""
* ^status = #active
* ^experimental = false
//* content = #complete
// Codes representing types of sensitive health information under AB352
* #ABORTION "Abortion-related services" "Health information related to abortion services, including procedures, counseling, and follow-up care."
* #GENDER_AFFIRMING_CARE "Gender-affirming care" "Health information related to gender-affirming care, including hormone therapy, surgeries, and counseling."
* #CONTRACEPTION "Contraception" "Health information related to contraception methods, counseling, and management."


Alias: $loinc = http://loinc.org
Alias: $snomed = http://snomed.info/sct
Alias: $icd9cm = http://hl7.org/fhir/sid/icd-9-cm
Alias: $icd10cm = http://hl7.org/fhir/sid/icd-10-cm
Alias: $cpt = http://www.ama-assn.org/go/cpt

ValueSet: VS_AB352_Segmentation_Tags
Id: vs-ab352-segmentation-tags
Title: "AB352 Segmentation Tags"
Description: "ValueSet of security labels used to segment AB352-sensitive health information in meta.security."
* ^status = #active
* ^experimental = false
* codes from system CS_Health_Sensitivity

ValueSet: VS_Abortion_Topics
Id: vs-abortion-topics
Title: "Abortion-Related Health Topics"
Description: """
Abortion-related clinical concepts drawn from LOINC, SNOMED CT, and ICD-10-CM.
Intended for segmentation of sensitive reproductive health information.

The ICD-10-CM codes above are directly grounded in the retrieved sources:
- ICDcodes.ai  abortion documentation guide (O04.x) - https://icdcodes.ai/diagnosis/abortion/documentation?utm_source=copilot.com
- HealthNet abortion diagnosis list (O00.x) - https://providerlibrary.healthnetcalifornia.com/content/dam/centene/healthnet/pdfs/providerlibrary/500073-Abortion-DX-Code-List.pdf?utm_source=copilot.com
"""
* ^status = #active
* ^experimental = false

// ------------------------------------------------------------
// LOINC — abortion-related observations & procedures
// ------------------------------------------------------------
* $loinc#8665-2      // Induced abortion [History]
* $loinc#8666-0      // Spontaneous abortion [History]
* $loinc#11636-8     // Abortion method
* $loinc#11637-6     // Abortion complications
* $loinc#11638-4     // Abortion outcome
* $loinc#11639-2     // Abortion date
* $loinc#11640-0     // Number of abortions


// ------------------------------------------------------------
// SNOMED CT — procedures, findings, and pregnancy outcomes
// ------------------------------------------------------------
* $snomed#386637004   // Induced abortion (procedure)
* $snomed#17369002    // Spontaneous abortion (disorder)
* $snomed#19154009    // Therapeutic abortion (procedure)
* $snomed#237244005   // Medical abortion (procedure)
* $snomed#77386006    // Incomplete abortion (disorder)
* $snomed#28956005    // Missed abortion (disorder)
* $snomed#63487001    // Habitual abortion (disorder)
* $snomed#169745008   // Abortion with complications (finding)
* $snomed#199347004    // Pregnancy termination counseling (procedure)



// ------------------------------------------------------------
// ICD-10-CM — abortion-related diagnoses
// ------------------------------------------------------------
* $icd10cm#O00.00   // Abdominal pregnancy without intrauterine pregnancy
* $icd10cm#O00.01   // Abdominal pregnancy with intrauterine pregnancy
* $icd10cm#O00.101   // Right tubal pregnancy without intrauterine pregnancy
* $icd10cm#O00.102   // Left tubal pregnancy without intrauterine pregnancy
* $icd10cm#O00.109   // Unspecified tubal pregnancy without intrauterine pregnancy
* $icd10cm#O00.111   // Right tubal pregnancy with intrauterine pregnancy
* $icd10cm#O00.112   // Left tubal pregnancy with intrauterine pregnancy
* $icd10cm#O03.9     // Spontaneous abortion, unspecified
* $icd10cm#O04.1     // Medical abortion, incomplete, without complication
* $icd10cm#O04.4     // Medical abortion, incomplete, with complication
* $icd10cm#O07.4     // Failed attempted abortion, without complication
* $icd10cm#O07.5     // Failed attempted abortion, with complication


ValueSet: VS_Gender_Affirming_Care_HealthNet
Id: vs-gender-affirming-care-healthnet
Title: "Gender-Affirming Care Codes (Health Net California)"
Description: """
CPT and ICD-10-CM codes referenced in Health Net California’s clinical policy
'HNCA.CP.MP.496 – Gender Affirming Procedures'. Intended for segmentation of
gender-affirming care under AB352.
"""
* ^status = #active
* ^experimental = false

// ------------------------------------------------------------
// CPT CODES (from Health Net “Coding Implications” section)
// ------------------------------------------------------------
* $cpt#11960
* $cpt#11950
* $cpt#11951
* $cpt#11952
* $cpt#11953
* $cpt#11954
* $cpt#11970
* $cpt#14000
* $cpt#14001
* $cpt#14040
* $cpt#14041
* $cpt#15100
* $cpt#15101
* $cpt#15120
* $cpt#15121
* $cpt#15200
* $cpt#15570
* $cpt#15574
* $cpt#15600
* $cpt#15620
* $cpt#15757
* $cpt#15758
* $cpt#15775
* $cpt#15776
* $cpt#15780
* $cpt#15781
* $cpt#15782
* $cpt#15783
* $cpt#15786
* $cpt#15787
* $cpt#15788
* $cpt#15789
* $cpt#15792
* $cpt#15793
* $cpt#15820
* $cpt#15821
* $cpt#15822
* $cpt#15823
* $cpt#15824
* $cpt#15825
* $cpt#15826
* $cpt#15828
* $cpt#15829
* $cpt#15830
* $cpt#15832
* $cpt#15833
* $cpt#15834
* $cpt#15835
* $cpt#15836
* $cpt#15837
* $cpt#15838
* $cpt#15839
* $cpt#15876
* $cpt#15877
* $cpt#15878
* $cpt#15879
* $cpt#17380
* $cpt#19300
* $cpt#19301
* $cpt#19303
* $cpt#19316
* $cpt#19318
* $cpt#19325
* $cpt#19350
* $cpt#21120
* $cpt#21121
* $cpt#21122
* $cpt#21123
* $cpt#21125
* $cpt#21127
* $cpt#21208
* $cpt#21209
* $cpt#21210
* $cpt#21270
* $cpt#30400
* $cpt#30410
* $cpt#30420
* $cpt#30430
* $cpt#30435
* $cpt#30450
* $cpt#31580
* $cpt#31587
* $cpt#31599
* $cpt#31899
* $cpt#44145
* $cpt#53400
* $cpt#53405
* $cpt#53410
* $cpt#53415
* $cpt#53420
* $cpt#53425
* $cpt#53430
* $cpt#53460
* $cpt#54125
* $cpt#54340
* $cpt#54400
* $cpt#54401
* $cpt#54405
* $cpt#54406
* $cpt#54408
* $cpt#54410
* $cpt#54411
* $cpt#54415
* $cpt#54416
* $cpt#54417
* $cpt#54520
* $cpt#54660
* $cpt#54690
* $cpt#55175
* $cpt#55180
* $cpt#55970
* $cpt#55980
* $cpt#56625
* $cpt#56800
* $cpt#56805
* $cpt#56810
* $cpt#57106
* $cpt#57107
* $cpt#57110
* $cpt#57111
* $cpt#57291
* $cpt#57292
* $cpt#57295
* $cpt#57296
* $cpt#57335
* $cpt#57426
* $cpt#58150
* $cpt#58180
* $cpt#58260
* $cpt#58262
* $cpt#58263
* $cpt#58267
* $cpt#58270
* $cpt#58275
* $cpt#58280
* $cpt#58285


ValueSet: VS_Gender_Affirming_Care
Id: vs-gender-affirming-care
Title: "Gender-Affirming Care Topics"
Description: """
Clinical concepts related to gender-affirming care drawn from LOINC, SNOMED CT, and ICD-10-CM.
Intended for segmentation of sensitive gender-affirming care information under AB352.
"""
* ^status = #active
* ^experimental = false

// ------------------------------------------------------------
// LOINC — gender identity, transition-related assessments, hormones
// ------------------------------------------------------------
* $loinc#76691-5     // Gender identity
* $loinc#99502-0     // Sex assigned at birth
* $loinc#99501-2     // Patient's pronouns
* $loinc#99503-8     // Gender transition status
* $loinc#74013-4     // Estradiol [Mass/volume] (monitoring HRT)
* $loinc#16128-1     // Testosterone [Mass/volume] (monitoring HRT)
* $loinc#30522-7      // LH/FSH panel (puberty blocker monitoring)


// ------------------------------------------------------------
// SNOMED CT — gender-affirming procedures, therapies, findings
// ------------------------------------------------------------
* $snomed#718344006     // Gender-affirming hormone therapy
* $snomed#133931009     // Gender dysphoria (finding)
* $snomed#443883004     // Counseling for gender identity
* $snomed#306080006     // Orchiectomy (gender-affirming)
* $snomed#18286008      // Mastectomy (gender-affirming)
* $snomed#450337009     // Vaginoplasty (gender-affirming)
* $snomed#450338004     // Phalloplasty (gender-affirming)
* $snomed#450339007     // Metoidioplasty (gender-affirming)
* $snomed#450340009     // Breast augmentation (gender-affirming)
* $snomed#386637004     // Hormone administration (procedure)


// ------------------------------------------------------------
// ICD-10-CM — gender dysphoria, endocrine management, encounters
// ------------------------------------------------------------
* $icd10cm#F64.0       // Transsexualism / gender dysphoria
* $icd10cm#F64.1       // Dual-role transvestism
* $icd10cm#F64.2       // Gender identity disorder of childhood
* $icd10cm#F64.8       // Other gender identity disorders
* $icd10cm#F64.9       // Gender identity disorder, unspecified
* $icd10cm#Z87.890     // Personal history of sex reassignment
* $icd10cm#Z79.890     // Long-term use of hormone therapy
* $icd10cm#Z51.81      // Encounter for therapeutic drug monitoring (HRT)



ValueSet: VS_Contraception
Id: vs-contraception
Title: "Contraception-Related Health Topics"
Description: """
Clinical concepts related to contraception drawn from LOINC, SNOMED CT, and ICD-10-CM.
Intended for segmentation of sensitive reproductive health information under AB352.

does not include code recommendations from Health Net California.
"""
* ^status = #active
* ^experimental = false

// ------------------------------------------------------------
// LOINC — contraceptive method, history, counseling, monitoring
// ------------------------------------------------------------
* $loinc#8663-7      // Contraceptive method [History]
* $loinc#8664-5      // Contraceptive use [History]
* $loinc#74013-4     // Estradiol (HRT / contraceptive monitoring)
* $loinc#16128-1     // Testosterone (HRT / contraceptive relevance)
* $loinc#39294-1     // Pregnancy intention
* $loinc#39295-8     // Contraceptive counseling note
* $loinc#56899-0     // Contraception education


// ------------------------------------------------------------
// SNOMED CT — contraceptive procedures, devices, counseling
// ------------------------------------------------------------
* $snomed#147451000119108   // Contraception education (procedure)
* $snomed#386761002         // Contraceptive management (procedure)
* $snomed#169745008         // Contraception counseling (finding)
* $snomed#449010006         // Insertion of intrauterine contraceptive device
* $snomed#386637004         // Hormone administration (relevant to contraceptive therapy)
* $snomed#304527002         // Oral contraceptive pill regimen
* $snomed#703423000         // Emergency contraception
* $snomed#169472004         // Sterilization counseling
* $snomed#265010009          // Tubal ligation (female sterilization)


// ------------------------------------------------------------
// ICD-10-CM — contraceptive management, surveillance, complications
// ------------------------------------------------------------
* $icd10cm#Z30.011    // Encounter for initial prescription of contraceptive pills
* $icd10cm#Z30.012    // Encounter for renewal of contraceptive pills
* $icd10cm#Z30.013    // Encounter for emergency contraception
* $icd10cm#Z30.014    // Encounter for initial prescription of injectable contraceptive
* $icd10cm#Z30.015    // Encounter for surveillance of injectable contraceptive
* $icd10cm#Z30.016    // Encounter for initial prescription of transdermal patch
* $icd10cm#Z30.017    // Encounter for surveillance of transdermal patch
* $icd10cm#Z30.018    // Encounter for other contraceptive management
* $icd10cm#Z30.019    // Encounter for unspecified contraceptive management
* $icd10cm#Z30.430    // Encounter for insertion of IUD
* $icd10cm#Z30.431    // Encounter for removal of IUD
* $icd10cm#Z30.432    // Encounter for removal and reinsertion of IUD
* $icd10cm#Z30.2      // Sterilization
* $icd10cm#Z30.8      // Other contraceptive management
* $icd10cm#Z30.9       // Contraceptive management, unspecified

