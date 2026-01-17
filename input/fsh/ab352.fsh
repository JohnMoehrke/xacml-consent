Instance: Consent-AB352-Example
InstanceOf: Consent
Title: "AB352 Organizational Privacy Consent - depth"
Description: """
A FHIR Consent instance that is an explicit consent for AB 352 protected data, with provisions that reflect the statutory requirements, with auto-filter bypassed for in-state recipients.

- permit TPO
  - deny sensitive data [for TPO]
    - permit in-state [sensitive data for TPO]
"""
Usage: #example

* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category[0] = http://loinc.org#64292-6 "Release of information consent"

* patient = Reference(http://example.org/Patient/example)
* dateTime = "2025-01-15T12:00:00Z"

* organization[0] = Reference(http://example.org/Organization/ca-hospital)
* organization[0].display = "Example California Hospital"

* policyRule.coding.system = "urn:ietf:rfc:3986"
* policyRule.coding.code = #urn:law:us:ca:statute:AB352
* policyRule.coding.display = "California AB 352"

//* policy[0].authority = "https://example-hospital.org"
//* policy[0].uri = "urn:org:hospital:policyset:AB352"

* provision[0]
  * type = #permit
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HPAYMT
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HOPERAT
  * securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal"

  * provision[0]
    * type = #deny
        // Out-of-state recipient  -- By NOT specifying a location, we mean all
    * securityLabel[+] = CS_Health_Sensitivity#ABORTION
    * securityLabel[+] = CS_Health_Sensitivity#GENDER_AFFIRMING_CARE
    * securityLabel[+] = CS_Health_Sensitivity#CONTRACEPTION
    // Note this does leave ambiguous any R data that are not these three sensitivity tags.
    // don't need to restate purpose as it is inherited from parent provision.

    * provision[0]
      * type = #permit
      // In-state recipient, are permitted to access the sensitive data
      * extension[+].url = "http://hl7.org/fhir/StructureDefinition/consent-location"
      * extension[=].valueReference = Reference(Location/ca-location) 
        // don't need to restate the purpose and securityLabel here since they are inherited from the parent provision.
// Note that R4 Consent does not address what rule applies if NONE of the provisions match. (R6 has a default rule at the top level)

Instance: Consent-AB352-Example2
InstanceOf: Consent
Title: "AB352 Organizational Privacy Consent - breath"
Description: """
A FHIR Consent instance that is an explicit consent for AB 352 protected data, with provisions that reflect the statutory requirements, with auto-filter bypassed for in-state recipients.

Breath first - not possible with R6 consent structure, but shown here for clarity.

- permit TPO
  - deny sensitive data [for TPO]
  - permit in-state sensitive data [for TPO]
"""
Usage: #example

* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category[0] = http://loinc.org#64292-6 "Release of information consent"

* patient = Reference(http://example.org/Patient/example)
* dateTime = "2025-01-15T12:00:00Z"

* organization[0] = Reference(http://example.org/Organization/ca-hospital)
* organization[0].display = "Example California Hospital"

* policyRule.coding.system = "urn:ietf:rfc:3986"
* policyRule.coding.code = #urn:law:us:ca:statute:AB352
* policyRule.coding.display = "California AB 352"

//* policy[0].authority = "https://example-hospital.org"
//* policy[0].uri = "urn:org:hospital:policyset:AB352"

* provision[0]
  * type = #permit
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HPAYMT
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HOPERAT
  * securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal"

  * provision[0]
    * type = #deny
        // Out-of-state recipient  -- By NOT specifying a location, we mean all
    * securityLabel[+] = CS_Health_Sensitivity#ABORTION
    * securityLabel[+] = CS_Health_Sensitivity#GENDER_AFFIRMING_CARE
    * securityLabel[+] = CS_Health_Sensitivity#CONTRACEPTION
    // Note this does leave ambiguous any R data that are not these three sensitivity tags.
    // don't need to restate purpose as it is inherited from parent provision.

  * provision[1]
    * type = #permit
    // In-state recipient, are permitted to access the sensitive data
    * extension[+].url = "http://hl7.org/fhir/StructureDefinition/consent-location"
    * extension[=].valueReference = Reference(Location/ca-location) 
    * securityLabel[+] = CS_Health_Sensitivity#ABORTION
    * securityLabel[+] = CS_Health_Sensitivity#GENDER_AFFIRMING_CARE
    * securityLabel[+] = CS_Health_Sensitivity#CONTRACEPTION
        // don't need to restate purpose as it is inherited from parent provision.
// Note that R4 Consent does not address what rule applies if NONE of the provisions match. (R6 has a default rule at the top level)

Instance: Consent-AB352-Example-AllowAll
InstanceOf: Consent
Title: "AB352 Organizational Privacy Consent - Allow All"
Description: """
A FHIR Consent instance that is an explicit consent for AB 352 protected data, with provisions that reflect Patient allowing all access.

- permit TPO
"""
Usage: #example

* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category[0] = http://loinc.org#64292-6 "Release of information consent"

* patient = Reference(http://example.org/Patient/example)
* dateTime = "2025-01-15T12:00:00Z"

* organization[0] = Reference(http://example.org/Organization/ca-hospital)
* organization[0].display = "Example California Hospital"

* policyRule.coding.system = "urn:ietf:rfc:3986"
* policyRule.coding.code = #urn:law:us:ca:statute:AB352
* policyRule.coding.display = "California AB 352"

* policy[0].authority = "https://example-hospital.org"
* policy[0].uri = "urn:org:hospital:policyset:AB352"

* provision[0]
  * type = #permit
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#TREAT
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HPAYMT
  * purpose[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HOPERAT

  * securityLabel[+] = CS_Health_Sensitivity#ABORTION
  * securityLabel[+] = CS_Health_Sensitivity#GENDER_AFFIRMING_CARE
  * securityLabel[+] = CS_Health_Sensitivity#CONTRACEPTION
  * securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal"
  * securityLabel[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R "Restricted"

Instance: ca-location
InstanceOf: Location
Title: "California Location"
Description: "Location resource representing California for use in Consent provisions."
* status = #active
* address.state = "CA"


CodeSystem: CS_Health_Sensitivity
Id: cs-health-sensitivity
Title: "Health Information Sensitivity Categories"
Description: """
Code system defining sensitivity categories for health information segmentation under California AB352.

Note did not use HL7 v2-ActCodes as two of the three categories are not represented there, and the GENDER code may be more broad than GENDER_AFFIRMING_CARE as intended here.
"""
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
//* content = #complete
// Codes representing types of sensitive health information under AB352
* #ABORTION "Abortion-related services" "Health information related to abortion services, including procedures, counseling, and follow-up care."
* #GENDER_AFFIRMING_CARE "Gender-affirming care" "Health information related to gender-affirming care, including hormone therapy, surgeries, and counseling."
* #CONTRACEPTION "Contraception" "Health information related to contraception methods, counseling, and management."

ValueSet: VS_AB352_Segmentation_Tags
Id: vs-ab352-segmentation-tags
Title: "AB352 Segmentation Tags"
Description: "ValueSet of security labels used to segment AB352-sensitive health information in meta.security."
* ^status = #active
* ^experimental = false
* codes from system CS_Health_Sensitivity

Alias: $loinc = http://loinc.org
Alias: $snomed = http://snomed.info/sct
Alias: $icd9cm = http://hl7.org/fhir/sid/icd-9-cm
Alias: $icd10cm = http://hl7.org/fhir/sid/icd-10-cm
Alias: $cpt = http://www.ama-assn.org/go/cpt




ValueSet: VS_Abortion_Topics_HealthNet
Id: vs-abortion-topics-healthnet
Title: "Abortion-Related Health Topics (Health Net California)"
Description: """
Health Net explains and references 500073-Abortion-DX-Code-List.pdf file primarily within its Provider Library and through Provider Bulletins related to legislative compliance. The specific explanation is found in the context of Assembly Bill (AB) 352, which mandates the segregation and protection of sensitive health data.

**Where the Explanation is Located:**

1. **Provider Bulletin 24-351 (New Laws Help Safeguard Privacy):** Health Net (and its affiliate Wellcare) issued this bulletin to explain the requirements of AB 352. The bulletin explicitly identifies abortion and abortion-related services as "Sensitive Services" that must be:
   - Segregated from the rest of the patient's medical record.
   - Excluded from automatic sharing with the California Data Exchange Framework (DxF).
   - Protected from out-of-state subpoenas or investigations.
   - **Reference:** [Wellcare/Health Net Bulletin 24-351](https://providerlibrary.healthnetcalifornia.com/)

2. **Health Net Provider Library - `Pregnancy Termination` Section:** The website hosts a dedicated page for pregnancy termination benefits. It explains that to comply with California laws (specifically SB 245 for cost-sharing and AB 352 for privacy), providers must use specific diagnosis codes. The 500073 PDF serves as the technical master list for these required codes.
   - **Reference:** [Pregnancy Termination - Health Net Provider Library](https://providerlibrary.healthnetcalifornia.com/)

3. **The PDF Itself:** The document title, `ICD-10-CM Codes for Abortion-Related Services,` is the direct label Health Net uses on its search results and directory pages to explain what the file contains. It lists codes ranging from O00 (Ectopic pregnancy) to Z33.2 (Encounter for elective termination).

**How Health Net Directs Providers to Use This File:**

According to the site's AB 352 guidance, Health Net recommends that IT and Billing departments download this PDF and use the listed codes to create firewalls in EHR systems. If a patient's record contains any code found in 500073-Abortion-DX-Code-List.pdf, the system should automatically:
- Block that data from being sent to out-of-state entities.
- Prevent the data from being discovered in automated health information exchanges.

**Direct Link to the Document:** [500073-Abortion-DX-Code-List.pdf](https://providerlibrary.healthnetcalifornia.com/content/dam/centene/healthnet/pdfs/providerlibrary/500073-Abortion-DX-Code-List.pdf)

**Note:** This list may not be all-inclusive and is subject to change.
"""
* ^status = #active
* ^experimental = false

// ------------------------------------------------------------
// ICD-10-CM — Abortion-related diagnoses (Health Net CA)
// ------------------------------------------------------------
* $icd10cm#O00.00   // Abdominal pregnancy without intrauterine pregnancy
* $icd10cm#O00.01   // Abdominal pregnancy with intrauterine pregnancy
* $icd10cm#O00.101  // Right tubal pregnancy without intrauterine pregnancy
* $icd10cm#O00.102  // Left tubal pregnancy without intrauterine pregnancy
* $icd10cm#O00.109  // Unspecified tubal pregnancy without intrauterine pregnancy
* $icd10cm#O00.111  // Right tubal pregnancy with intrauterine pregnancy
* $icd10cm#O00.112  // Left tubal pregnancy with intrauterine pregnancy
* $icd10cm#O00.119  // Unspecified tubal pregnancy with intrauterine pregnancy
* $icd10cm#O00.201  // Right ovarian pregnancy without intrauterine pregnancy
* $icd10cm#O00.202  // Left ovarian pregnancy without intrauterine pregnancy
* $icd10cm#O00.209  // Unspecified ovarian pregnancy without intrauterine pregnancy
* $icd10cm#O00.211  // Right ovarian pregnancy with intrauterine pregnancy
* $icd10cm#O00.212  // Left ovarian pregnancy with intrauterine pregnancy
* $icd10cm#O00.219  // Unspecified ovarian pregnancy with intrauterine pregnancy
* $icd10cm#O00.80   // Other ectopic pregnancy without intrauterine pregnancy
* $icd10cm#O00.81   // Other ectopic pregnancy with intrauterine pregnancy
* $icd10cm#O00.90   // Unspecified ectopic pregnancy without intrauterine pregnancy
* $icd10cm#O00.91   // Unspecified ectopic pregnancy with intrauterine pregnancy
* $icd10cm#O01.1    // Incomplete and partial hydatidiform mole
* $icd10cm#O01.9    // Hydatidiform mole, unspecified
* $icd10cm#O02.1    // Missed abortion
* $icd10cm#O03.0    // Genital tract and pelvic infection following incomplete spontaneous abortion
* $icd10cm#O03.1    // Delayed or excessive hemorrhage following incomplete spontaneous abortion
* $icd10cm#O03.2    // Embolism following incomplete spontaneous abortion
* $icd10cm#O03.30   // Unspecified complication following incomplete spontaneous abortion
* $icd10cm#O03.32   // Renal failure following incomplete spontaneous abortion
* $icd10cm#O03.33   // Metabolic disorder following incomplete spontaneous abortion
* $icd10cm#O03.34   // Damage to pelvic organs following incomplete spontaneous abortion
* $icd10cm#O03.35   // Other venous complications following incomplete spontaneous abortion
* $icd10cm#O03.36   // Cardiac arrest following incomplete spontaneous abortion
* $icd10cm#O03.37   // Sepsis following incomplete spontaneous abortion
* $icd10cm#O03.38   // Urinary tract infection following incomplete spontaneous abortion
* $icd10cm#O03.39   // Incomplete spontaneous abortion with other complications
* $icd10cm#O03.4    // Incomplete spontaneous abortion without complication
* $icd10cm#O03.5    // Genital tract and pelvic infection following complete or unspecified spontaneous abortion
* $icd10cm#O03.6    // Delayed or excessive hemorrhage following complete or unspecified spontaneous abortion
* $icd10cm#O03.7    // Embolism following complete or unspecified spontaneous abortion
* $icd10cm#O03.80   // Unspecified complication following complete or unspecified spontaneous abortion
* $icd10cm#O03.81   // Shock following complete or unspecified spontaneous abortion
* $icd10cm#O03.82   // Renal failure following complete or unspecified spontaneous abortion
* $icd10cm#O03.83   // Metabolic disorder following complete or unspecified spontaneous abortion
* $icd10cm#O03.84   // Damage to pelvic organs following complete or unspecified spontaneous abortion
* $icd10cm#O03.85   // Other venous complications following complete or unspecified spontaneous abortion
* $icd10cm#O03.86   // Cardiac arrest following complete or unspecified spontaneous abortion
* $icd10cm#O03.87   // Sepsis following complete or unspecified spontaneous abortion
* $icd10cm#O03.88   // Urinary tract infection following complete or unspecified spontaneous abortion
* $icd10cm#O03.89   // Complete or unspecified spontaneous abortion with other complications
* $icd10cm#O03.9    // Complete or unspecified spontaneous abortion without complication
* $icd10cm#O04.5    // Genital tract and pelvic infection following (induced) termination of pregnancy
* $icd10cm#O04.6    // Delayed or excessive hemorrhage following (induced) termination of pregnancy
* $icd10cm#O04.7    // Embolism following (induced) termination of pregnancy
* $icd10cm#O04.80   // (Induced) termination of pregnancy with unspecified complications
* $icd10cm#O04.81   // Shock following (induced) termination of pregnancy
* $icd10cm#O04.82   // Renal failure following (induced) termination of pregnancy
* $icd10cm#O04.83   // Metabolic disorder following (induced) termination of pregnancy
* $icd10cm#O04.84   // Damage to pelvic organs following (induced) termination of pregnancy
* $icd10cm#O04.85   // Other venous complications following (induced) termination of pregnancy
* $icd10cm#O04.86   // Cardiac arrest following (induced) termination of pregnancy
* $icd10cm#O04.87   // Sepsis following (induced) termination of pregnancy
* $icd10cm#O04.88   // Urinary tract infection following (induced) termination of pregnancy
* $icd10cm#O04.89   // (Induced) termination of pregnancy with other complications
* $icd10cm#O07.0    // Genital tract and pelvic infection following failed attempted termination of pregnancy
* $icd10cm#O07.1    // Delayed or excessive hemorrhage following failed attempted termination of pregnancy
* $icd10cm#O07.2    // Embolism following failed attempted termination of pregnancy
* $icd10cm#O07.30   // Failed attempted termination of pregnancy with unspecified complications
* $icd10cm#O07.31   // Shock following failed attempted termination of pregnancy
* $icd10cm#O07.32   // Renal failure following failed attempted termination of pregnancy
* $icd10cm#O07.33   // Metabolic disorder following failed attempted termination of pregnancy
* $icd10cm#O07.34   // Damage to pelvic organs following failed attempted termination of pregnancy
* $icd10cm#O07.35   // Other venous complications following failed attempted termination of pregnancy
* $icd10cm#O07.36   // Cardiac arrest following failed attempted termination of pregnancy
* $icd10cm#O07.37   // Sepsis following failed attempted termination of pregnancy
* $icd10cm#O07.38   // Urinary tract infection following failed attempted termination of pregnancy
* $icd10cm#O07.39   // Failed attempted termination of pregnancy with other complications
* $icd10cm#O07.4    // Failed attempted termination of pregnancy without complication
* $icd10cm#O08.2    // Embolism following ectopic and molar pregnancy
* $icd10cm#O08.3    // Shock following ectopic and molar pregnancy
* $icd10cm#O08.4    // Renal failure following ectopic and molar pregnancy
* $icd10cm#O08.82   // Sepsis following ectopic and molar pregnancy
* $icd10cm#O08.83   // Urinary tract infection following an ectopic and molar pregnancy
* $icd10cm#O08.89   // Other complications following an ectopic and molar pregnancy
* $icd10cm#O20.0    // Threatened abortion
* $icd10cm#O20.8    // Other hemorrhage in early pregnancy
* $icd10cm#O20.9    // Hemorrhage in early pregnancy, unspecified
* $icd10cm#Q89.7    // Multiple congenital malformations, not elsewhere classified
* $icd10cm#Z33.2    // Encounter for elective termination of pregnancy
* $icd10cm#Z64.0    // Problems related to unwanted pregnancy


ValueSet: VS_Gender_Affirming_Care_HealthNet
Id: vs-gender-affirming-care-healthnet
Title: "Gender-Affirming Care Codes (Health Net California)"
Description: """
CPT and ICD-10-CM codes referenced in Health Net California's clinical policy
'HNCA.CP.MP.496 - Gender Affirming Procedures'. Intended for segmentation of
gender-affirming care under AB352.

**Health Net Bulletin 24-351**

Health Net's [bulletin 24-351](https://providerlibrary.healthnetcalifornia.com/) explicitly tells providers that services defined in policies like HNCA.CP.MP.496 must be:

- **Blocked from automatic sharing** with the California Data Exchange Framework (DxF).
- **Omitted from responses** to out-of-state subpoenas or investigations.
- **Flagged within the EHR** to prevent unauthorized access by users outside of California.

**Where to Find and Download HNCA.CP.MP.496.pdf** Health Net maintains this policy in several locations within their provider libraries:

- **Direct PDF Link:** [HNCA.CP.MP.496 - Gender Affirming Procedures](https://providerlibrary.healthnetcalifornia.com/content/dam/centene/healthnet/pdfs/providerlibrary/HNCA.CP.MP.496.pdf)
- **The Provider Library Archive:** You can find this by navigating to Health Net Provider Library > Resources > Clinical Policies and searching for `Gender Affirming Procedures` or the code `496.`
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
//* $cpt#11953
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




ValueSet: VS_Contraception_AI
Id: vs-contraception-ai
Title: "Contraception-Related Health Topics"
Description: """
Clinical concepts related to contraception drawn from LOINC, SNOMED CT, and ICD-10-CM.
Intended for segmentation of sensitive reproductive health information under AB352.

This ValueSet does not include code recommendations from Health Net California. Health Net California does not have a single source document for contraception-related codes similar to their abortion-related code list. Instead, Health Net references multiple sources, including the DHCS Family PACT Code List, within various policy documents.

- **Health Net Bulletin 24-351:** New Laws Help Safeguard Privacy ([View Link](https://providerlibrary.healthnetcalifornia.com/))
- **Health Net Medi-Cal Provider Manual (Chapter 4):** Sensitive Services section ([Link to Manuals](https://providerlibrary.healthnetcalifornia.com/))
- **Family PACT Policies:** Health Net adopts the DHCS Family PACT Code List as their baseline for identifying what constitutes a contraceptive service.
"""
* ^status = #active
* ^experimental = false

// ------------------------------------------------------------
// LOINC — contraceptive method, history, counseling, education
// ------------------------------------------------------------
* $loinc#8663-7 //"Contraceptive method [History]"
* $loinc#8664-5 //"Contraceptive use [History]"

// ------------------------------------------------------------
// SNOMED CT — contraception counseling, management, LARC, sterilization
// ------------------------------------------------------------
* $snomed#169745008 //"Contraception counseling"
* $snomed#386761002 //"Contraceptive management (procedure)"
* $snomed#304527002 //"Oral contraceptive pill regimen"
* $snomed#169472004 //"Sterilization counseling"

// ------------------------------------------------------------
// ICD-10-CM — contraceptive management, surveillance, sterilization
// ------------------------------------------------------------
* $icd10cm#Z30.011 //"Encounter for initial prescription of contraceptive pills"
* $icd10cm#Z30.012 //"Encounter for renewal of contraceptive pills"
* $icd10cm#Z30.013 //"Encounter for emergency contraception"
* $icd10cm#Z30.014 //"Encounter for initial prescription of injectable contraceptive"
* $icd10cm#Z30.015 //"Encounter for surveillance of injectable contraceptive"
* $icd10cm#Z30.016 //"Encounter for initial prescription of transdermal patch"
* $icd10cm#Z30.017 //"Encounter for surveillance of transdermal patch"
* $icd10cm#Z30.018 //"Encounter for other contraceptive management"
* $icd10cm#Z30.019 //"Encounter for unspecified contraceptive management"
* $icd10cm#Z30.2   //"Encounter for sterilization"
* $icd10cm#Z30.430 //"Encounter for insertion of IUD"
* $icd10cm#Z30.431 //"Encounter for removal of IUD"
* $icd10cm#Z30.432 //"Encounter for removal and reinsertion of IUD"
* $icd10cm#Z30.8   //"Other specified contraceptive management"
* $icd10cm#Z30.9   //"Contraceptive management, unspecified"
// ------------------------------------------------------------
// CPT — LARC, sterilization, and related contraceptive procedures
// ------------------------------------------------------------
// LARC – implants
* $cpt#11981 //"Insertion, non-biodegradable drug delivery implant"
* $cpt#11982 //"Removal, non-biodegradable drug delivery implant"
* $cpt#11983 //"Removal with reinsertion, non-biodegradable drug delivery implant"

// LARC – IUD
* $cpt#58300 //"Insertion of intrauterine device (IUD)"
* $cpt#58301 //"Removal of intrauterine device (IUD)"

// Sterilization – female
* $cpt#58600 //"Ligation or transection of fallopian tube(s), abdominal or vaginal"
* $cpt#58611 //"Ligation or transection of fallopian tube(s) at time of cesarean delivery"
* $cpt#58615 //"Occlusion of fallopian tube(s) by device (eg, band, clip)"
* $cpt#58670 //"Laparoscopy, surgical; with fulguration of oviducts"
* $cpt#58671 //"Laparoscopy, surgical; with occlusion of oviducts by device"

// Sterilization – male
* $cpt#55250 //"Vasectomy, unilateral or bilateral"

// Counseling (family planning context)
* $cpt#99401 //"Preventive counseling, individual, approx. 15 minutes"
* $cpt#99402 //"Preventive counseling, individual, approx. 30 minutes"
* $cpt#99403 //"Preventive counseling, individual, approx. 45 minutes"
* $cpt#99404 //"Preventive counseling, individual, approx. 60 minutes"
