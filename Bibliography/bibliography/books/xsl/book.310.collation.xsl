<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="collation">
		<td id="row-label">Collation:</td>
		<td>
			<xsl:apply-templates select="format"/>
			<xsl:apply-templates select="dimensions"/>
			<xsl:apply-templates select="collationFormula"/>
			<xsl:apply-templates select="totalLeaves"/>
			<xsl:apply-templates select="pagination"/>
		</td>
	</xsl:template>

	<xsl:template match="format">
		<xsl:value-of select="."/>
		<!-- degree sign -->
		<!-- <xsl:text>&#xb0;</xsl:text> -->
		<!-- masculine ordinal indicator unicode U+00BA -->
		<!-- <xsl:text>&#xba;</xsl:text>  -->
		<!-- superscript 'o' -->
		<span id="super">
			<span id="super">
				<xsl:text>o</xsl:text>
			</span>		</span>
		<!-- modifier letter large	 o unicode -->
		<!-- <xsl:text>&#x1d3c;</xsl:text>  -->
		<xsl:text>: </xsl:text>
	</xsl:template>

	<xsl:template match="dimensions">
		<xsl:value-of select="height"/>
		<xsl:text> x </xsl:text>
		<xsl:value-of select="width"/>
		<xsl:text>: </xsl:text>
	</xsl:template>

	<xsl:template match="collationFormula">
		<xsl:apply-templates select="gatherings/gatheringRange"/>
		<xsl:choose>
			<xsl:when test="signatureLeaves = 'unsigned'">
				<xsl:text> [unsigned]</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text> [</xsl:text>
				<xsl:value-of select="signatureLeaves"/>
				<xsl:apply-templates select="anomSignatures"/>
				<xsl:text> signed</xsl:text>
				<xsl:apply-templates select="signaturePattern"/>
				<xsl:apply-templates select="signingErrors"/>
				<xsl:text>]</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>; </xsl:text>
	</xsl:template>

	<xsl:template match="totalLeaves">
		<xsl:value-of select="."/>
		<xsl:choose>
			<xsl:when test=". = '1'">
				<xsl:text> leaf, </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text> leaves, </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="gatheringRange">

		<!-- print dupSeq only when it changes or when it's the first one -->
		<xsl:if
			test="position() = 1 or not(preceding-sibling::*[1]/dupSeq) or dupSeq != preceding-sibling::*[1]/dupSeq">
			<xsl:apply-templates select="dupSeq"/>
		</xsl:if>

		<xsl:if test="@signed = 'false'">
			<xsl:text>[</xsl:text>
		</xsl:if>
		<xsl:value-of select="multSigStart"/>
		<xsl:value-of select="sigStart"/>
		<xsl:apply-templates select="sigEnd"/>
		<xsl:if test="@signed = 'false'">
			<xsl:text>]</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="leaves"/>

		<xsl:if test="note">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="note"/>
			<xsl:text>)</xsl:text>
		</xsl:if>



		<xsl:apply-templates select="alteration"/>

		<!-- If the next sibiling has a child <dupSeq> and it is different from dupSeq, add ',' to separate series -->
		<xsl:if
			test="./following-sibling::*[1]/dupSeq and not(dupSeq = following-sibling::*[1]/dupSeq)">
			<xsl:text>,</xsl:text>
		</xsl:if>

		<xsl:if test="position() != last()">
			<xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="leaves">
		<xsl:choose>
			<!-- Do not show "1" as an index figure -->
			<xsl:when test=". = 1">
				<xsl:value-of select="."/>
			</xsl:when>
			<xsl:when test="parent::*[@disjunct]">
				<xsl:text>1,2</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<span id="super">
					<xsl:value-of select="."/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="alteration">
		<xsl:if test="position() = 1">
			<xsl:text>(</xsl:text>
		</xsl:if>
		<xsl:if test="alterationType = '−' or alterationType = '±'">
			<xsl:choose>
				<xsl:when test="alterationType = preceding-sibling::*[1]/alterationType">
					<xsl:text>,</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="alterationType"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="position() = 1">
					<xsl:apply-templates select="dupSeq"/>
					<xsl:value-of select="multSig"/>
					<xsl:apply-templates select="sigRef"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="LEAF" select="substring(sigRef, 2)"/>
					<xsl:value-of select="$LEAF"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="note"/>
		</xsl:if>
		<xsl:if test="alterationType = '+'">
			<xsl:apply-templates select="dupSeq"/>
			<xsl:value-of select="multSig"/>
			<xsl:apply-templates select="sigRef"/>
			<xsl:value-of select="alterationType"/>
			<xsl:value-of select="count"/>
		</xsl:if>
		<xsl:if test="position() = last()">
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="end | sigEnd">
		<xsl:text>&#x2013;</xsl:text>
		<!--  en dash unicode U+2013 -->
		<xsl:value-of select="../multSigEnd"/>
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="cancellation">
		<xsl:text>(</xsl:text>
		<xsl:value-of select="."/>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<xsl:template match="signaturePattern">
		<xsl:text>; signing </xsl:text>
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="anomSignatures">

		<xsl:text> (</xsl:text>
		<xsl:apply-templates select="anomSignature"/>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<xsl:template match="anomSignature">
		<!-- THIS SEEMS TO WORK FINE, BUT REQUIRES THAT THE anomSignatures -->
		<!-- BE SORTED. anomType '−' before '+', then by ?dupeSeq?, signature and leaf -->
		<!-- Using xsl:sort processes the nodes in correct order, but preceding-sibling axis still based on document order, so  -->
		<!-- the grouping does not work. For solutions see http://p2p.wrox.com/xslt/24003-preceding-sibling-after-sort.html -->
		<!-- or http://docstore.mik.ua/orelly/xml/xslt/ch06_02.htm -->

		<!-- TODO: THIS DOES NOT WORK WITH NUMERIC SIGREFS -->

		<!-- print anomType only when it changes -->
		<xsl:if test="position() = 1 or anomType != preceding-sibling::*[1]/anomType">
			<xsl:value-of select="anomType"/>
		</xsl:if>

		<xsl:apply-templates select="dupSeqSig"/>

		<xsl:variable name="SIG" select="substring(sigRef, 1, 1)"/>
		<xsl:variable name="LEAF" select="substring(sigRef, 2)"/>

		<!-- print signature only when it changes -->
		<xsl:if
			test="position() = 1 or substring(sigRef, 1, 1) != substring(preceding-sibling::*[1]/sigRef, 1, 1) or dupSeqSig != preceding-sibling::*[1]/dupSeqSig">
			<xsl:value-of select="multSig"/>
			<xsl:value-of select="$SIG"/>
		</xsl:if>

		<xsl:value-of select="$LEAF"/>

		<xsl:choose>
			<!-- print ';' between '-' and '+'. -->
			<xsl:when test="anomType = '−' and following-sibling::*[1]/anomType = '+'">
				<xsl:text>;</xsl:text>
			</xsl:when>
			<!-- print ',' between leaves, but not after the last -->
			<xsl:when test="position() != last()">
				<xsl:text>,</xsl:text>
			</xsl:when>
		</xsl:choose>

	</xsl:template>

	<xsl:template match="signingErrors">
		<xsl:text>; signing </xsl:text>
		<xsl:apply-templates select="signingError"/>
		<xsl:apply-templates select="note"/>
	</xsl:template>

	<xsl:template match="signingError">
		<xsl:apply-templates select="dupSeqSig"/>
		<xsl:value-of select="multSig"/>
		<xsl:apply-templates select="sigRef"/>
		<xsl:text> as </xsl:text>
		<xsl:value-of select="badSig"/>
		<xsl:if test="position() != last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="pagination">
		<xsl:text>pp. </xsl:text>
		<xsl:apply-templates select="pageRanges/pageRange"/>
		<xsl:apply-templates select="pagingErrors"/>
		<xsl:apply-templates select="notes"/>
	</xsl:template>

	<xsl:template match="pageRange">

		<!-- print dupSeq only when (a) it is not 1 and (b) it changes -->
		<xsl:if
			test="dupSeq != 1 and (not(preceding-sibling::*[1]/dupSeq) or dupSeq != preceding-sibling::*[1]/dupSeq)">
			<xsl:apply-templates select="dupSeq"/>
		</xsl:if>

		<xsl:if test="@numbered = 'false'">
			<xsl:text>[</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="@isUncounted = 'true'">
				<span id="italic">
					<xsl:value-of select="start"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="start"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="end"/>

		<!-- For unnnumbered ranges, add hair space after italic number, before right bracket  -->
		<xsl:if test="@numbered = 'false' and @isUncounted = 'true'">
			<xsl:text>&#x200a;</xsl:text>
		</xsl:if>

		<xsl:if test="@numbered = 'false'">
			<xsl:text>]</xsl:text>
		</xsl:if>

		<xsl:choose>
			<!-- If the next sibiling has a child <dupSeq> and it is different from dupSeq, add ',' to separate series -->
			<xsl:when
				test="./following-sibling::*[1]/dupSeq and not(dupSeq = following-sibling::*[1]/dupSeq)">
				<xsl:text>,</xsl:text>
			</xsl:when>
			<!-- If the current start page is a roman numeral and the following start page is not, add ',' to separate series -->
			<!-- XPath 2.0 provides a cleaner function matches(start,RegEx), but browsers support only XPath 1.0 -->
			<xsl:when test="
					(contains(start, 'i')
					or contains(start, 'v')
					or contains(start, 'x'))
					and not(contains(following-sibling::*[1]/start, 'i')
					or contains(following-sibling::*[1]/start, 'v')
					or contains(following-sibling::*[1]/start, 'x'))">
				<xsl:text>,</xsl:text>
			</xsl:when>
		</xsl:choose>

		<xsl:text> </xsl:text>
		<xsl:value-of select="note"/>

	</xsl:template>

	<xsl:template match="dupSeq | dupSeqSig | dupSeqPage">
		<span id="super">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>

	<xsl:template match="pagingErrors">
		<xsl:text>[misprinting </xsl:text>
		<xsl:apply-templates select="pagingError"/>
		<xsl:text>]</xsl:text>
	</xsl:template>

	<xsl:template match="pagingError">
		<xsl:apply-templates select="dupSeqPage"/>
		<xsl:value-of select="start"/>
		<xsl:text> as </xsl:text>
		<xsl:value-of select="badPage"/>
		<xsl:if test="position() != last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
