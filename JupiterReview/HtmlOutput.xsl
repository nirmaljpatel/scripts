<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Review Comments</h2>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>
							<xsl:text>Id</xsl:text>
						</th>
						<th>
							<xsl:text>Type</xsl:text>
						</th>
						<th>
							<xsl:text>Severity</xsl:text>
						</th>
						<th>
							<xsl:text>Status</xsl:text>
						</th>
						<th>
							<xsl:text>File</xsl:text>
						</th>
						<th>
							<xsl:text>Summary</xsl:text>
						</th>
						<th>
							<xsl:text>Description</xsl:text>
						</th>
						<th>
							<xsl:text>ReviewerId</xsl:text>
						</th>
						<th>
							<xsl:text>Logged On</xsl:text>
						</th>
						<th>
							<xsl:text>Last Modified On</xsl:text>
						</th>
					</tr>
					<xsl:for-each select="Review">
						<xsl:for-each select="ReviewIssue">
							<tr>
								<td>
									<xsl:value-of select="position()"/>
								</td>
								<td>
									<xsl:for-each select="Type">
										<xsl:value-of select="substring-after(.,'item.type.label.')"/>
									</xsl:for-each>
								</td>
								<td>
									<xsl:for-each select="Severity">
										<xsl:value-of select="substring-after(.,'item.severity.label.')"/>
									</xsl:for-each>
								</td>
								<td>
									<xsl:for-each select="Status">
										<xsl:value-of select="substring-after(.,'item.status.label.')"/>
									</xsl:for-each>
								</td>
								<td>
									<xsl:for-each select="File">
										<xsl:apply-templates/>
									</xsl:for-each>
									<xsl:text>:</xsl:text>
									<xsl:for-each select="File">
										<xsl:for-each select="@line">
											<xsl:value-of select="string(.)"/>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td>
									<xsl:value-of select="Summary"/>
								</td>
								<td>
									<pre>
										<xsl:value-of select="Description"/>
									</pre>
								</td>
								<td>
									<xsl:value-of select="ReviewerId"/>
								</td>
								<xsl:for-each select="ReviewIssueMeta">
									<td>
										<xsl:value-of select="CreationDate"/>
									</td>
									<td>
										<xsl:value-of select="LastModificationDate"/>
									</td>
								</xsl:for-each>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>