<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "title">
        Beegen
    <#elseif section = "header">
        <div class="login-left">
            <div class="image-container">
                <img src="${url.resourcesPath}/img/mb-tower.jpg" alt="Login Image" class="login-image">
            </div>
        </div>
        <div class="login-right">
            <div class="login-left-container">
                <div class="logo-container">
                    <img src="${url.resourcesPath}/img/logo.png" alt="Logo" class="logo">
                </div>
                <div class="welcome-text">
                    <h2>${msg("systemName")}</h2>
                    <h4 class="slogan">Fast code - Smart mode 2025</h4>
                </div>
            </div>
                        <div class="login-content">
                <div class="login-form-container">
                    <div class="form-content">
                        <form id="kc-form-login" action="${url.loginAction}" method="post">
                            <div class="input-group">
                                <div class="input-wrapper">
                                    <label for="username">
                                        ${msg("username")}
                                        <span class="required">*</span>
                                    </label>
                                    <input type="text" id="username" name="username" value="${(login.username!'')}" 
                                           placeholder="${msg("placeholder.username")}" autofocus autocomplete="off" />
                                    <#if message?? && message.type == "error" && message.parameters?? && message.parameters.username??>
                                        <div class="validation-message">
                                            <i class="fa-solid fa-triangle-exclamation"></i>
                                            <span>${message.parameters.username}</span>
                                        </div>
                                    </#if>
                                </div>
                                
                                <div class="input-wrapper">
                                    <label for="password">
                                        ${msg("password")}
                                        <span class="required">*</span>
                                    </label>
                                    <div class="password-wrapper">
                                        <input type="password" id="password" name="password" 
                                               placeholder="${msg("placeholder.password")}" autocomplete="off" />
                                        <span class="toggle-password">
                                            <i class="fa-regular fa-eye"></i>
                                        </span>
                                    </div>
                                    <#if message?? && message.type == "error" && message.parameters?? && message.parameters.password??>
                                        <div class="validation-message">
                                            <i class="fa-solid fa-triangle-exclamation"></i>
                                            <span>${message.parameters.password}</span>
                                        </div>
                                    </#if>
                                </div>
                            </div>
                            
                            <#if message?? && message.type == "error" && (!message.parameters?? || (message.parameters?? && !message.parameters.username?? && !message.parameters.password??))>
                                <div class="validation-message global-error">
                                    <i class="fa-solid fa-triangle-exclamation"></i>
                                    <span>${message.summary}</span>
                                </div>
                            </#if>
                            
                            <div class="form-buttons">
                                <button type="submit" class="login-button">
                                    ${msg("doLogIn")}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="vector-blue-container" style="position: absolute; bottom: -5px;right: 2rem;">
                <img src="${url.resourcesPath}/img/vector-blue.svg" alt="Vector Blue" class="vector-blue">
            </div>
        </div>       
    </#if>
</@layout.registrationLayout> 