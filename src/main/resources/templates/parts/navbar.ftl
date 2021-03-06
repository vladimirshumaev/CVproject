<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Test Crud</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/"><span>Home</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/products"><span>Products</span></a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user"><span>User list</span></a>
            </li>
            </#if>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="/" role="button" aria-haspopup="true" aria-expanded="false">Spring</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/spring">Spring</a>
                    <a class="dropdown-item" href="/solid">SOLID</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="/" role="button" aria-haspopup="true" aria-expanded="false">HTTP</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/rest">REST</a>
                    <a class="dropdown-item" href="/soap">SOAP</a>
                </div>
            </li>
        </ul>

        <div class="navbar-text mr-3" >${name}</div>
        <@l.logout/>
    </div>
</nav>