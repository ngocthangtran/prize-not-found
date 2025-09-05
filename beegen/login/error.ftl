<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${msg("errorTitle")}
    <#elseif section = "header">
        <div class="login-left">
            <div class="login-left-container">
                <div class="logo-container">
                    <img src="${url.resourcesPath}/img/logo.png" alt="Logo" class="logo">
                </div>
                <div class="welcome-text">
                    <h1>
                        <img src="${url.resourcesPath}/img/hand.gif" alt="Wave" class="wave-emoji">
                        Chào mừng bạn đến với
                    </h1>
                    <h2>Beegen Chat</h2>
                </div>
            </div>
        </div>
    <#elseif section = "form">
        <div class="login-right">
            <div class="image-container">
                <img src="${url.resourcesPath}/img/image.png" alt="Login Image" class="login-image">
            </div>
            <div class="login-content">
                <div class="login-form-container">
                    <div class="error-container">
                        <h3 class="error-title">${msg("errorTitle")}</h3>
                        <div class="error-message">
                            <#if message?has_content>
                                <div class="alert alert-error">
                                    <span class="${properties.kcFeedbackErrorIcon!}"></span>
                                    <span class="alert-message">${kcSanitize(message.summary)?no_esc}</span>
                                </div>
                            </#if>
                        </div>
                        <div class="error-actions">
                            <a href="${client.baseUrl}" class="back-link">${msg("doBack")}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout> 