package com.general.project.controller;

    import org.springframework.boot.web.servlet.error.ErrorController;
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.GetMapping;

    import javax.servlet.http.HttpServletResponse;
    import java.io.IOException;

@Controller
public class RedirectUnknownUrls implements ErrorController {

    @GetMapping("/error_404")
    public String redirectErrorPage() throws IOException {
        return "/error_404";
    }

    @GetMapping("/error")
    public void redirectNonExistentUrlsToHome(HttpServletResponse response) throws IOException {
        response.sendRedirect("/error_404");
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}