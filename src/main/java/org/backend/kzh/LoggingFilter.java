package org.backend.kzh;
import org.backend.kzh.controller.SyncController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Component  // Registers this filter as a Spring component.
public class LoggingFilter extends OncePerRequestFilter {

    private static final Logger logger = LoggerFactory.getLogger(LoggingFilter.class);  // Logger instance for logging.

    @Override
    protected void doFilterInternal(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response, FilterChain filterChain)
            throws jakarta.servlet.ServletException, IOException {
        
        // Log request details before processing the request.
        logger.info("Request: Method={}, URI={}, Headers={}", 
                    request.getMethod(), 
                    request.getRequestURI()
                    );
        
//        String s = SyncController.getBody(request);
//        
//        logger.info("REQUEST DATA: " + s);
//        getRequestHeaders(request)

        long startTime = System.currentTimeMillis();  // Capture the start time to measure processing duration.

        try {
            filterChain.doFilter(request, response);  // Continue with the next filter in the chain.
        } finally {
            long duration = System.currentTimeMillis() - startTime;  // Calculate how long the request took.

            // Log response details after request processing.
            logger.info("Response: Status={}, URI={}, Duration={}ms, Headers={}", 
                        response.getStatus(), 
                        request.getRequestURI(), 
                        duration
//                        getResponseHeaders(response));
                        );

            // Log any exceptions that occurred during processing.
            if (request.getAttribute("javax.servlet.error.exception") != null) {
                logger.error("Exception during request processing", 
                             (Exception) request.getAttribute("javax.servlet.error.exception"));
            }
        }
    }

//    // Utility method to extract request headers for logging.
//    private String getRequestHeaders(HttpServletRequest request) {
//        return request.getHeaderNames().asIterator()
//                      .asIterator()
//                      .forEachRemaining(header -> logger.info("Request Header: {}={}", header, request.getHeader(header)));
//    }
//
//    // Utility method to extract response headers for logging.
//    private String getResponseHeaders(HttpServletResponse response) {
//        return response.getHeaderNames().stream()
//                      .forEach(header -> logger.info("Response Header: {}={}", header, response.getHeader(header)));
//    }
}
