<#if executionData.job.group != "">
    <#assign jobName="${executionData.job.group} / ${executionData.job.name}">
<#else>
    <#assign jobName="${executionData.job.name}">
</#if>
<#assign title="**${executionData.job.project}/${jobName}(#${executionData.id})**\n">

<#if executionData.status == "succeeded">
    <#assign style="info">
<#elseif executionData.status == "failed">
    <#assign style="warning">
<#elseif executionData.status == "aborted">
    <#assign style="warning">
<#else>
    <#assign style="comment">
</#if>

<#assign result="状态: <font color='${style}'>${executionData.status}</font>\n">
<#assign startTime="开始: ${executionData.dateStarted?string[\"yyyy-MM-dd HH:mm:ss\"]}\n">

<#if executionData.dateEnded??>
<#assign endTime="结束: ${executionData.dateEnded?string[\"yyyy-MM-dd HH:mm:ss\"]}\n">
<#else>
<#assign endTime="">
</#if>

<#assign user="用户: ${executionData.user}\n">
<#assign link="详情: [查看](${executionData.href})\n">

<#if mentions != "">
<#assign mentioned="@${mentions}">
<#else>
<#assign mentioned="">
</#if>

{
  "msgtype": "markdown",
  "markdown": {
    "content": "${title}${result}${startTime}${endTime}${user}${link}${mentioned}"
  }
}