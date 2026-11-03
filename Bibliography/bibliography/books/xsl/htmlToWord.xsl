<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dml="http://test" xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml">
    <!--
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
	xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml">
	-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <w:wordDocument xml:space="preserve">
            <w:styles>
                <w:style w:type="table" w:styleId="MyTableStyle">
                    <w:name w:val="My Table Style"/>
                    <w:tblPr>
                        <w:tblCellMar>
                            <w:left w:w="128" w:type="dxa"/>
                            <w:right w:w="128" w:type="dxa"/>
                        </w:tblCellMar>
                        <!--
						<w:tblBorders>
							<w:top w:val="single"/>
							<w:left w:val="single"/>
							<w:bottom w:val="single"/>
							<w:right w:val="single"/>
							<w:insideH w:val="single"/>
							<w:insideV w:val="single"/>
						</w:tblBorders>
						 -->
                    </w:tblPr>
                </w:style>
            </w:styles>
            <w:body>
                <xsl:apply-templates select="node()"/>
            </w:body>
        </w:wordDocument>
    </xsl:template>

    <xsl:template match="head | meta | link | hr | h2 | h3 | p"/>

    <xsl:template match="table">
        <w:tbl>
            <w:tblPr>
                <w:tblStyle w:val="MyTableStyle"/>
            </w:tblPr>
            <xsl:apply-templates select="node()"/>
        </w:tbl>
    </xsl:template>
    <xsl:template match="tr">
        <w:tr>
            <xsl:if test="@id = 'continue'">
                <w:tc>
                    <w:tcPr>
                        <w:vmerge/>
                    </w:tcPr>
                    <w:p/>
                </w:tc>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </w:tr>
    </xsl:template>
    <xsl:template match="td">
        <w:tc>
            <xsl:if test="@colspan">
                <w:tcPr>
                    <w:gridSpan w:val="{@colspan}"/>
                </w:tcPr>
            </xsl:if>
            <xsl:if test="@rowspan">
                <w:tcPr>
                    <w:vmerge w:val="restart"/>
                </w:tcPr>
            </xsl:if>
            <w:p>
                <xsl:apply-templates/>
            </w:p>
        </w:tc>
    </xsl:template>
    <xsl:template match="td//text()">
        <w:r>
            <w:t>
                <xsl:copy-of select="dml:normalize(.)"/>
            </w:t>
        </w:r>
    </xsl:template>

    <xsl:template match="td/span">
        <xsl:choose>
            <xsl:when test="@id = 'blackletter'">
                <w:r>
                    <w:rPr>
                        <w:rFonts w:ascii="Old English Text MT"/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="@id = 'italic'">
                <w:r>
                    <w:rPr>
                        <w:i/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="@id = 'italicred'">
                <w:r>
                    <w:rPr>
                        <w:i/>
                        <w:u w:val="words"/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="@id = 'italsmallcap'">
                <w:r>
                    <w:rPr>
                        <w:i/>
                        <w:smallCaps/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="@id = 'red'">
                <w:r>
                    <w:rPr>
                        <w:u w:val="words"/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="@id = 'smallcap'">
                <w:r>
                    <w:rPr>
                        <w:smallCaps/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="@id = 'smallcapred'">
                <w:r>
                    <w:rPr>
                        <w:smallCaps/>
                        <w:u w:val="words"/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="@id = 'sub'">
                <w:r>
                    <w:rPr>
                        <w:vertAlign w:val="subscript"/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="@id = 'super'">
                <w:r>
                    <w:rPr>
                        <w:vertAlign w:val="superscript"/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:otherwise>
                <w:r>
                    <w:t>
                        <xsl:value-of select="dml:normalize(.)"/>
                    </w:t>
                </w:r>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="a">
        <xsl:choose>
            <xsl:when test="contains(@href, 'estc')">
                <w:r>
                    <w:t>
                        <xsl:value-of select="dml:normalize(text())"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="contains(@href, '.xml')">
                <w:r>
                    <w:rPr>
                        <w:i/>
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="dml:normalize(text())"/>
                    </w:t>
                </w:r>
            </xsl:when>
            <xsl:when test="contains(@href, 'google')">
                <w:r>
                    <w:t>
                        <xsl:value-of select="dml:normalize(text())"/>
                    </w:t>
                </w:r>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="br">
        <w:br/>
    </xsl:template>

    <xsl:template match="td/p">
        <w:br/>
        <w:br/>
    </xsl:template>

    <xsl:function name="dml:normalize">
        <xsl:param name="input"/>
        <xsl:choose>
            <xsl:when test="starts-with($input, ' ') and ends-with($input, ' ')">
                <xsl:value-of
                    select="
                        string-join((' ',
                        normalize-space($input),
                        ' '), '')"
                />
            </xsl:when>
            <xsl:when test="starts-with($input, ' ')">
                <xsl:value-of
                    select="
                        string-join((' ',
                        normalize-space($input)), '')"
                />
            </xsl:when>
            <xsl:when test="ends-with($input, ' ')">
                <xsl:value-of
                    select="
                        string-join((normalize-space($input),
                        ' '), '')"
                />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space($input)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>
