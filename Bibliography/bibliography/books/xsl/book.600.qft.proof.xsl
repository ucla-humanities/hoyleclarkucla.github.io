<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="titlePart | contentPart | RTPart | cwFoot | cwHead | note">

        <xsl:variable name="style" select="@rend"/>

        <xsl:choose>
            <!-- EXTERNAL LINKS OPEN IN NEW WINDOW -->
            <xsl:when test="@url and starts-with(@url, 'http')">
                <a href="{@url}" target="blank_">
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <!-- PDF FILES OPEN OPEN IN NEW WINDOW -->
            <xsl:when test="@url and contains(@url, '.pdf')">
                <a href="{@url}" target="blank_">
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <!-- INTERNAL LINKS OPEN IN SAME WINDOW -->
            <xsl:when test="@url">
                <a href="{@url}">
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:when test="@rend = 'paragraph'">
                <p/>
            </xsl:when>
            <xsl:when test="@rend = 'break'">
                <br/>
            </xsl:when>
            <xsl:when test="not(@rend)">
                <span id="roman">
                    <xsl:call-template name="replaceNewLines">
                        <xsl:with-param name="stringIn" select="."/>
                        <xsl:with-param name="break">
                            <xsl:call-template name="linebreak"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span id="{$style}">
                    <xsl:call-template name="replaceNewLines">
                        <xsl:with-param name="stringIn" select="."/>
                        <xsl:with-param name="break">
                            <xsl:call-template name="linebreak"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="linebreak">
        <br/>
    </xsl:template>

    <xsl:template name="replaceNewLines">
        <xsl:param name="stringIn"/>
        <xsl:param name="break"/>
        <xsl:choose>
            <xsl:when test="contains($stringIn, '|')">
                <xsl:value-of select="substring-before($stringIn, '|')"/>
                <xsl:copy-of select="$break"/>
                <xsl:call-template name="replaceNewLines">
                    <xsl:with-param name="stringIn" select="substring-after($stringIn, '|')"/>
                    <xsl:with-param name="break">
                        <xsl:call-template name="linebreak"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$stringIn"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>