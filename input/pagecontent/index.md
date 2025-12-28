
Shows how a Consent resource can use [XACML](https://en.wikipedia.org/wiki/XACML) policy sets to express the patient specific rules and the organization specific rules

<div markdown="1" class="stu-note">

<br/>
This IG is founded on HL7 FHIR Revision {{site.data.fhir.version}} found at [{{site.data.fhir.path}}]({{site.data.fhir.path}})
<br/>
</div>

The [Consent](Consent-ExampleFHIRConsentXACML.html) points at the [overriding policy](#xacml-overriding-policy) and the [patient specific policy](#xacml-patient-consent-policy) as shown below. This is [Profiled](StructureDefinition-fhir-consent-xacml.html):

~~~mermaid
graph TD
    A[FHIR Consent Resource] -->|policy.uri| B[XACML Overriding Policy]
    A -->|sourceReference| C[XACML Patient Consent Policy]
    style B fill:#ff0000,color:#fff
    style C fill:#ff0000,color:#fff

~~~

### XACML Policies

Using XACML leverages an existing standard for defining access control policies. XACML policies are XML documents that specify rules for granting or denying access to resources based on various attributes, such as user roles, resource types, and environmental conditions.

#### XACML Overriding Policy

The XACML Overriding Policy is a policy set that defines the overarching access control rules for FHIR resources. This policy is intended to be used in conjunction with patient-specific XACML policies referenced in FHIR Consent resources. The overriding policy ensures that certain organizational or regulatory requirements are consistently applied across all patient consents.

~~~xml
{% include_relative xacml-overriding.xml %}
~~~

#### XACML Patient Consent Policy

The XACML Patient Consent Policy is a policy document that defines the specific access control rules for an individual patient. This policy is referenced in the FHIR Consent resource and works in conjunction with the XACML Overriding Policy to determine access permissions for FHIR resources.

~~~xml
{% include_relative xacml-consent.xml %}
~~~

### Source

The source code for this Implementation Guide can be found on [GitHub](https://github.com/JohnMoehrke/xacml-consent)

#### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

#### Dependency Table

{% include dependency-table.xhtml %}

#### Globals Table

{% include globals-table.xhtml %}

#### IP Statements

{% include ip-statements.xhtml %}
