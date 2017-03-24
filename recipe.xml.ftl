<?xml version="1.0"?>
<recipe>
 	
	<#if generateKotlin>

	<instantiate from="src/app_package/kotlin/Contract.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className?lower_case}/${className}Contract.kt" />


	<instantiate from="src/app_package/kotlin/Presenter.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className?lower_case}/${className}Presenter.kt" />

	<#if isFragment>

	<instantiate from="src/app_package/kotlin/MvpFragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className?lower_case}/${className}Fragment.kt" />

	</#if>

	<#if !isFragment>

	<instantiate from="src/app_package/kotlin/MvpActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className?lower_case}/${className}Activity.kt" />

	</#if>

	</#if>

	<#if !generateKotlin>	
	
	<instantiate from="src/app_package/Contract.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className?lower_case}/${className}Contract.java" />

	<instantiate from="src/app_package/Presenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className?lower_case}/${className}Presenter.java" />

	<#if isFragment>

	<instantiate from="src/app_package/MvpViewFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className?lower_case}/${className}Fragment.java" />

	</#if>

	<#if !isFragment>

	<instantiate from="src/app_package/MvpViewActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/${className?lower_case}/${className}Activity.java" />

	</#if>

	</#if>


	<#if includeLayout>

	<#if isFragment>

	<instantiate from="res/layout/mvp_activity.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/fragment_${className?lower_case}.xml" />

        <open file="${escapeXmlAttribute(resOut)}/layout/fragment_${className?lower_case}.xml" />

	</#if>


	<#if !isFragment>

	<instantiate from="res/layout/mvp_activity.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/activity_${className?lower_case}.xml" />

        <open file="${escapeXmlAttribute(resOut)}/layout/activity_${className?lower_case}.xml" />

	<merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

	</#if>

  	</#if>

	<open file="${srcOut}/ui/${className?lower_case}/${className}Contract.java"/>
</recipe>
