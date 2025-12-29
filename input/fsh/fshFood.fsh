

Instance:   ex-patient
InstanceOf: Patient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
//* identifier = urn:uuid:2.16.840.1.113883.4.349#MVI // MVI ICN VALUE WITH CHECKSUM>
// history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
// wiki - https://en.wikipedia.org/wiki/John_Jacob_Jingleheimer_Schmidt
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* name[+].use = #usual
* name[=].family = "Schmidt"
* name[=].given = "John"
* name[+].use = #old
* name[=].family = "Schnidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingle"
* name[=].given[+] = "Heimer"
* name[=].period.end = "1960"
* name[+].use = #official
* name[=].family = "Schmidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingleheimer"
* name[=].period.start = "1960-01-01"
* name[+].use = #nickname
* name[=].family = "Schmidt"
* name[=].given = "Jack"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"
* identifier[+].system = "http://example.org/mrn"
* identifier[=].value = "123456"

// FHIR Consent that references XACML policies, and therefore does not include any rules

Profile: FHIRConsentXACML
Parent: Consent
Id: fhir-consent-xacml
Title: "FHIR Consent with XACML Policies"
Description: "A FHIR Consent resource that references XACML policies for access control, without including any rules directly in the Consent. Therefore, it does not include any provisions directly within the Consent. The actual access rules are defined in the referenced XACML policy documents."
* provision 0..0
* scope 1..1
  * coding 1..1
  * coding = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category 1..1
  * coding 1..1 
  * coding = http://loinc.org#59284-0
* patient 1..1
* policy 1..1
  * ^comment = "The policy element is used to reference XACML policy documents that define the access control rules. The 'uri' sub-element points to the location of the XACML policy document, while the 'sourceReference' sub-element can be used to reference a DocumentReference resource containing the actual XACML policy."
  * authority 0..1
  * uri 1..1 // URI referencing the XACML policy document for overriding policy set 
* source[x] 1..1 // Attachment containing the patient specific XACML policy document
  * ^comment = "The sourceReference element points to a DocumentReference resource that contains the XACML policy document specific to the patient. This allows for the inclusion of patient-specific access control rules defined in XACML format."
* identifier ^slicing.discriminator.type = #type
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Identifiers for the patient specific XACML Policy Set"
* identifier contains XPS 1..* MS
* identifier[XPS].type.coding.code = #oasis:names:tc:xacml:1.0:Policy/@PolicyId (exactly)
* identifier[XPS].value 1..1

Instance: ExampleFHIRConsentXACMLreference
InstanceOf: FHIRConsentXACML
Title: "Example FHIR Consent with references to XACML Policies"
Description: "An example instance of a FHIR Consent resource that references XACML policies for access, and does not include any rules directly in the Consent."
* patient = Reference(ex-patient)
* policy[0].uri = "http://example.org/policies/xacml-overriding.xml"
* sourceAttachment.url = "http://example.org/policies/xacml-patient-consent-12345.xml"
* status = #active
* scope.coding = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category.coding = http://loinc.org#59284-0  "Consent Document"
* category.text = "Consent Document with XACML Policies"
* identifier[XPS].type.coding.code = #oasis:names:tc:xacml:1.0:Policy/@PolicyId
* identifier[XPS].value = "consent-policy-set-12345"

Instance: ExampleFHIRConsentXACMLcopy
InstanceOf: FHIRConsentXACML
Title: "Example FHIR Consent with copy of XACML Policies"
Description: "An example instance of a FHIR Consent resource that references XACML policies for access, and a copy of the patient specific XACML policy is included as a DocumentReference."
* patient = Reference(ex-patient)
* policy[0].uri = "http://example.org/policies/xacml-overriding.xml"
* sourceReference = Reference(xacml-patient-consent-12345)
* status = #active
* scope.coding = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category.coding = http://loinc.org#59284-0  "Consent Document"
* category.text = "Consent Document with XACML Policies"
* identifier[XPS].type.coding.code = #oasis:names:tc:xacml:1.0:Policy/@PolicyId
* identifier[XPS].value = "consent-policy-set-12345"



Instance: xacml-overriding
InstanceOf: DocumentReference
Title: "DocumentReference of the XACML overriding policy"
Description: "Example of a xml XACML overriding policy DocumentReference."
//* content.attachment.contentType = #application/xml
* content.attachment.id = "ig-loader-xacml-overriding.xml"
* status = #current
* type.text = "XACML Overriding Policy Document"
* identifier[+].type.coding.code = #oasis:names:tc:xacml:1.0:Policy/@PolicyId
* identifier[=].value = "Org_Policy_7890_Workflow_Governance"

Instance: xacml-patient-consent-12345
InstanceOf: DocumentReference
Title: "DocumentReference of the XACML Consent policy"
Description: "Example of a xml XACML Consent policy for Patient 12345 in a DocumentReference."
* status = #current
* type.coding = http://loinc.org#59284-0  "Consent Document"
* subject = Reference(ex-patient)
//* content.attachment.contentType = #application/xml
* content.attachment.id = "ig-loader-xacml-consent.xml"
* identifier[+].type.coding.code = #oasis:names:tc:xacml:1.0:Policy/@PolicyId
* identifier[=].value = "consent-policy-set-12345"

