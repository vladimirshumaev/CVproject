<#import "parts/common.ftl" as l>

<@l.page>

        <div class="post hentry uncustomized-post-template" itemprop="blogPost" itemscope="itemscope"
             itemtype="http://schema.org/BlogPosting">
            <meta content="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/3.x-diagram.png"
                  itemprop="image_url">
            <meta content="3996264961391078047" itemprop="blogId">
            <meta content="1143148288453138593" itemprop="postId">
            <a name="1143148288453138593"></a>
            <h3 class="post-title entry-title" itemprop="name">
                @RestController vs. @Controller
            </h3>
            <div class="post-header">
                <div class="post-header-line-1"></div>
            </div>
            <div class="post-body entry-content" id="post-body-1143148288453138593" itemprop="description articleBody">
                <div dir="ltr" style="text-align: left;" trbidi="on">
                    <div dir="ltr" style="text-align: left;" trbidi="on">
                        <div class="separator" style="clear: both; text-align: center;">
                            <br></div>
                        <h3 style="text-align: left;">
                            Spring MVC и REST&nbsp;</h3>
                        <div style="text-align: justify;">
                            Spring - MVC фреймфорк, использующий аннотации, которые позволяют облегчить процесс создания
                            RESTfull веб-сервиса. Основная разница между традиционным Spring MVC контроллером и RESTfull
                            веб-сервис контроллером заключается в способе создания тела HTTP ответа. MVC контроллер
                            опирается на технологию View, а RESTfull веб сервис контроллер &nbsp;возвращает объект,
                            который представляется в HTTP ответе &nbsp;в виде JSON или XML. Для более подробного
                            описания перейдите на эту <a
                                href="http://docs.spring.io/spring-framework/docs/current/spring-framework-reference/html/mvc.html"
                                target="_blank">ссылку</a>.
                        </div>
                        <h3 style="text-align: left;">
                            Схема работы Spring MVC</h3>
                        <div>
                            <ol style="text-align: left;">
                                <li>Клиент отправляет запрос к веб-сервису.</li>
                                <li>Запрос перехватывается DispatcherServlet, который ищет&nbsp;Handler Mappings и
                                    соответствующий тип.
                                </li>
                                <li>Запрос обрабатывается контроллером и результат передается DispatcherServlet, а потом
                                    перенаправляется во view.
                                </li>
                            </ol>
                            <h3 style="text-align: left;">
                                Использование&nbsp;@ResponseBody&nbsp;</h3>
                        </div>
                        <div style="text-align: justify;">
                            Когда вы используете аннотацию&nbsp;@ResponseBody для метода, Spring автоматически
                            записывает результат в тело http ответа. Каждый метод в контроллере должен иметь данную
                            аннотацию. Схема работы представлена на рисунке 1.
                        </div>
                        <table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container"
                               style="margin-left: auto; margin-right: auto; text-align: center;">
                            <tbody>
                            <tr>
                                <td style="text-align: center;"><a
                                        href="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/3.x-diagram.png"
                                        imageanchor="1" style="margin-left: auto; margin-right: auto;"><img border="0"
                                                                                                            height="188"
                                                                                                            src="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/3.x-diagram.png"
                                                                                                            width="400"></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="tr-caption" style="text-align: center;">Рисунок 1.</td>
                            </tr>
                            </tbody>
                        </table>
                        <h3 style="text-align: justify;">
                        </h3>
                        <h3 style="text-align: justify;">
                            Что происходит внутри</h3>
                        <div style="text-align: justify;">
                            У Spring есть список HttpMessageConverters.&nbsp;HttpMessageConverter обязан конвертировать
                            тело запроса к определенному классу и и класс к телу ответа, в зависимости от типа. Каждый
                            раз, когда происходит запрос с аннотацией @ResponseBody, Spring ищет &nbsp;среди всех
                            HttpMessageConverters подходящий и использует его.
                        </div>
                        <h3 style="text-align: left;">
                            Пример</h3>
                        <div>
                            Рассмотрим POJO класс:
                        </div>
                        <div>
                            <br></div>
                        <div>
                            <div id="highlighter_874240" class="syntaxhighlighter  java">
                                <div class="toolbar"><span><a href="#"
                                                              class="toolbar_item command_help help">?</a></span></div>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                    <tr>
                                        <td class="gutter">
                                            <div class="line number1 index0 alt2">1</div>
                                            <div class="line number2 index1 alt1">2</div>
                                            <div class="line number3 index2 alt2">3</div>
                                            <div class="line number4 index3 alt1">4</div>
                                            <div class="line number5 index4 alt2">5</div>
                                            <div class="line number6 index5 alt1">6</div>
                                            <div class="line number7 index6 alt2">7</div>
                                            <div class="line number8 index7 alt1">8</div>
                                            <div class="line number9 index8 alt2">9</div>
                                            <div class="line number10 index9 alt1">10</div>
                                            <div class="line number11 index10 alt2">11</div>
                                            <div class="line number12 index11 alt1">12</div>
                                            <div class="line number13 index12 alt2">13</div>
                                            <div class="line number14 index13 alt1">14</div>
                                            <div class="line number15 index14 alt2">15</div>
                                            <div class="line number16 index15 alt1">16</div>
                                            <div class="line number17 index16 alt2">17</div>
                                            <div class="line number18 index17 alt1">18</div>
                                            <div class="line number19 index18 alt2">19</div>
                                            <div class="line number20 index19 alt1">20</div>
                                        </td>
                                        <td class="code">
                                            <div class="container">
                                                <div class="line number1 index0 alt2"><code
                                                        class="java keyword">import</code> <code class="java plain">javax.xml.bind.annotation.XmlRootElement;</code>
                                                </div>
                                                <div class="line number2 index1 alt1"><code class="java color1">@XmlRootElement</code><code
                                                        class="java plain">(name = </code><code class="java string">"Employee"</code><code
                                                        class="java plain">)</code></div>
                                                <div class="line number3 index2 alt2"><code
                                                        class="java keyword">public</code> <code class="java keyword">class</code>
                                                    <code class="java plain">Employee {</code></div>
                                                <div class="line number4 index3 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java plain">String name; </code></div>
                                                <div class="line number5 index4 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java plain">String email;</code></div>
                                                <div class="line number6 index5 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">public</code> <code class="java plain">String
                                                    getName() {</code></div>
                                                <div class="line number7 index6 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">return</code> <code class="java plain">name;</code>
                                                </div>
                                                <div class="line number8 index7 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java plain">}</code></div>
                                                <div class="line number9 index8 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">public</code> <code class="java keyword">void</code>
                                                    <code class="java plain">setName(String name) {</code></div>
                                                <div class="line number10 index9 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">this</code><code class="java plain">.name =
                                                    name;</code></div>
                                                <div class="line number11 index10 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java plain">}</code></div>
                                                <div class="line number12 index11 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">public</code> <code class="java plain">String
                                                    getEmail() {</code></div>
                                                <div class="line number13 index12 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">return</code> <code class="java plain">email;</code>
                                                </div>
                                                <div class="line number14 index13 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java plain">}</code></div>
                                                <div class="line number15 index14 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">public</code> <code class="java keyword">void</code>
                                                    <code class="java plain">setEmail(String email) {</code></div>
                                                <div class="line number16 index15 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">this</code><code class="java plain">.email
                                                    = email;</code></div>
                                                <div class="line number17 index16 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java plain">}</code></div>
                                                <div class="line number18 index17 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java keyword">public</code> <code class="java plain">Employee()
                                                    {</code></div>
                                                <div class="line number19 index18 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                        class="java plain">} </code></div>
                                                <div class="line number20 index19 alt1"><code
                                                        class="java plain">}</code></div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        И класс с аннотацией&nbsp;@Controller:<br>
                        <br></div>
                    <div>
                        <div id="highlighter_768463" class="syntaxhighlighter  java">
                            <div class="toolbar"><span><a href="#" class="toolbar_item command_help help">?</a></span>
                            </div>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tbody>
                                <tr>
                                    <td class="gutter">
                                        <div class="line number1 index0 alt2">1</div>
                                        <div class="line number2 index1 alt1">2</div>
                                        <div class="line number3 index2 alt2">3</div>
                                        <div class="line number4 index3 alt1">4</div>
                                        <div class="line number5 index4 alt2">5</div>
                                        <div class="line number6 index5 alt1">6</div>
                                        <div class="line number7 index6 alt2">7</div>
                                        <div class="line number8 index7 alt1">8</div>
                                        <div class="line number9 index8 alt2">9</div>
                                        <div class="line number10 index9 alt1">10</div>
                                        <div class="line number11 index10 alt2">11</div>
                                        <div class="line number12 index11 alt1">12</div>
                                        <div class="line number13 index12 alt2">13</div>
                                        <div class="line number14 index13 alt1">14</div>
                                        <div class="line number15 index14 alt2">15</div>
                                        <div class="line number16 index15 alt1">16</div>
                                        <div class="line number17 index16 alt2">17</div>
                                        <div class="line number18 index17 alt1">18</div>
                                        <div class="line number19 index18 alt2">19</div>
                                        <div class="line number20 index19 alt1">20</div>
                                        <div class="line number21 index20 alt2">21</div>
                                        <div class="line number22 index21 alt1">22</div>
                                        <div class="line number23 index22 alt2">23</div>
                                    </td>
                                    <td class="code">
                                        <div class="container">
                                            <div class="line number1 index0 alt2"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.stereotype.Controller;</code>
                                            </div>
                                            <div class="line number2 index1 alt1"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.web.bind.annotation.PathVariable;</code>
                                            </div>
                                            <div class="line number3 index2 alt2"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.web.bind.annotation.RequestMapping;</code>
                                            </div>
                                            <div class="line number4 index3 alt1"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.web.bind.annotation.RequestMethod;</code>
                                            </div>
                                            <div class="line number5 index4 alt2"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.web.bind.annotation.ResponseBody;</code>
                                            </div>
                                            <div class="line number6 index5 alt1"><code
                                                    class="java keyword">import</code> <code class="java plain">com.example.spring.model.Employee;</code>
                                            </div>
                                            <div class="line number7 index6 alt2"><code
                                                    class="java color1">@Controller</code></div>
                                            <div class="line number8 index7 alt1"><code class="java color1">@RequestMapping</code><code
                                                    class="java plain">(</code><code
                                                    class="java string">"employees"</code><code
                                                    class="java plain">)</code></div>
                                            <div class="line number9 index8 alt2"><code
                                                    class="java keyword">public</code> <code
                                                    class="java keyword">class</code> <code class="java plain">EmployeeController
                                                {</code></div>
                                            <div class="line number10 index9 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">Employee employee = </code><code
                                                    class="java keyword">new</code> <code
                                                    class="java plain">Employee();</code></div>
                                            <div class="line number11 index10 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java color1">@RequestMapping</code><code class="java plain">(value
                                                = </code><code class="java string">"/{name}"</code><code
                                                    class="java plain">, method = RequestMethod.GET, produces
                                                = </code><code class="java string">"application/json"</code><code
                                                    class="java plain">)</code></div>
                                            <div class="line number12 index11 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java keyword">public</code> <code class="java color1">@ResponseBody</code>
                                                <code class="java plain">Employee getEmployeeInJSON(</code><code
                                                        class="java color1">@PathVariable</code> <code
                                                        class="java plain">String name) {</code></div>
                                            <div class="line number13 index12 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">employee.setName(name);</code></div>
                                            <div class="line number14 index13 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">employee.setEmail(</code><code
                                                    class="java string">"employee1@genuitec.com"</code><code
                                                    class="java plain">);</code></div>
                                            <div class="line number15 index14 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java keyword">return</code> <code class="java plain">employee; </code>
                                            </div>
                                            <div class="line number16 index15 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">}</code></div>
                                            <div class="line number17 index16 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java color1">@RequestMapping</code><code class="java plain">(value
                                                = </code><code class="java string">"/{name}.xml"</code><code
                                                    class="java plain">, method = RequestMethod.GET, produces
                                                = </code><code class="java string">"application/xml"</code><code
                                                    class="java plain">)</code></div>
                                            <div class="line number18 index17 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java keyword">public</code> <code class="java color1">@ResponseBody</code>
                                                <code class="java plain">Employee getEmployeeInXML(</code><code
                                                        class="java color1">@PathVariable</code> <code
                                                        class="java plain">String name) {</code></div>
                                            <div class="line number19 index18 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">employee.setName(name);</code></div>
                                            <div class="line number20 index19 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">employee.setEmail(</code><code
                                                    class="java string">"employee1@genuitec.com"</code><code
                                                    class="java plain">);</code></div>
                                            <div class="line number21 index20 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java keyword">return</code> <code class="java plain">employee; </code>
                                            </div>
                                            <div class="line number22 index21 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">}</code></div>
                                            <div class="line number23 index22 alt2"><code class="java plain">}</code>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    В результате получим:<br>
                    JSON:<span style="background-color: #999999;">&nbsp;http://localhost:8080/SpringRestControllerExample/rest/employees/Bob</span><br>
                    <br>
                    <div class="separator" style="clear: both; text-align: center;">
                        <a href="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/output_json-crop.png"
                           imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0"
                                                                                             src="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/output_json-crop.png"></a>
                    </div>
                    <div class="separator" style="clear: both; text-align: left;">
                        XML:&nbsp;<span style="background-color: #999999;">http://localhost:8080/SpringRestControllerExample/rest/employees/Bob.xml</span>
                    </div>
                    <div class="separator" style="clear: both; text-align: center;">
                        <a href="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/output_xml.png"
                           imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="151"
                                                                                             src="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/output_xml.png"
                                                                                             width="640"></a></div>
                    <div class="separator" style="clear: both; text-align: left;">
                        <span style="background-color: #999999;"><br></span></div>
                    <h3 style="text-align: left;">
                        Использование аннотации&nbsp;@RestController</h3>
                    <div>
                        В Spring 4.0 была представлена аннотация&nbsp;@RestController. Применив ее к контроллеру
                        добавляются аннотации&nbsp;@Controller, а так же @ResponseBody применяется ко всем методам.
                        Подробнее можно почитать <a
                            href="http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RestController.html"
                            target="_blank">здесь</a>. Схема работы на рисунке 2.
                    </div>
                    <div class="separator" style="clear: both; text-align: center;">
                        <a href="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/4.x-diagram.png"
                           imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0"
                                                                                             src="https://resources.cloud.genuitec.com/wp-content/uploads/2015/09/4.x-diagram.png"></a>
                    </div>
                    <div>
                        Рассмотрим этот же пример, но с новой аннотацией, POJO- класс не изменится, а контроллер примет
                        следующий вид:
                    </div>
                    <div>
                        <br></div>
                    <div>
                        <div id="highlighter_453800" class="syntaxhighlighter  java">
                            <div class="toolbar"><span><a href="#" class="toolbar_item command_help help">?</a></span>
                            </div>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tbody>
                                <tr>
                                    <td class="gutter">
                                        <div class="line number1 index0 alt2">1</div>
                                        <div class="line number2 index1 alt1">2</div>
                                        <div class="line number3 index2 alt2">3</div>
                                        <div class="line number4 index3 alt1">4</div>
                                        <div class="line number5 index4 alt2">5</div>
                                        <div class="line number6 index5 alt1">6</div>
                                        <div class="line number7 index6 alt2">7</div>
                                        <div class="line number8 index7 alt1">8</div>
                                        <div class="line number9 index8 alt2">9</div>
                                        <div class="line number10 index9 alt1">10</div>
                                        <div class="line number11 index10 alt2">11</div>
                                        <div class="line number12 index11 alt1">12</div>
                                        <div class="line number13 index12 alt2">13</div>
                                        <div class="line number14 index13 alt1">14</div>
                                        <div class="line number15 index14 alt2">15</div>
                                        <div class="line number16 index15 alt1">16</div>
                                        <div class="line number17 index16 alt2">17</div>
                                        <div class="line number18 index17 alt1">18</div>
                                        <div class="line number19 index18 alt2">19</div>
                                        <div class="line number20 index19 alt1">20</div>
                                        <div class="line number21 index20 alt2">21</div>
                                        <div class="line number22 index21 alt1">22</div>
                                        <div class="line number23 index22 alt2">23</div>
                                    </td>
                                    <td class="code">
                                        <div class="container">
                                            <div class="line number1 index0 alt2"><code
                                                    class="java keyword">package</code> <code class="java plain">com.example.spring.rest;</code>
                                            </div>
                                            <div class="line number2 index1 alt1"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.web.bind.annotation.PathVariable;</code>
                                            </div>
                                            <div class="line number3 index2 alt2"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.web.bind.annotation.RequestMapping;</code>
                                            </div>
                                            <div class="line number4 index3 alt1"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.web.bind.annotation.RequestMethod;</code>
                                            </div>
                                            <div class="line number5 index4 alt2"><code
                                                    class="java keyword">import</code> <code class="java plain">org.springframework.web.bind.annotation.RestController;</code>
                                            </div>
                                            <div class="line number6 index5 alt1"><code
                                                    class="java keyword">import</code> <code class="java plain">com.example.spring.model.Employee;</code>
                                            </div>
                                            <div class="line number7 index6 alt2"><code class="java color1">@RestController</code>
                                            </div>
                                            <div class="line number8 index7 alt1"><code class="java color1">@RequestMapping</code><code
                                                    class="java plain">(</code><code
                                                    class="java string">"employees"</code><code
                                                    class="java plain">)</code></div>
                                            <div class="line number9 index8 alt2"><code
                                                    class="java keyword">public</code> <code
                                                    class="java keyword">class</code> <code class="java plain">EmployeeController
                                                {</code></div>
                                            <div class="line number10 index9 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">Employee employee = </code><code
                                                    class="java keyword">new</code> <code
                                                    class="java plain">Employee();</code></div>
                                            <div class="line number11 index10 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java color1">@RequestMapping</code><code class="java plain">(value
                                                = </code><code class="java string">"/{name}"</code><code
                                                    class="java plain">, method = RequestMethod.GET, produces
                                                = </code><code class="java string">"application/json"</code><code
                                                    class="java plain">)</code></div>
                                            <div class="line number12 index11 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java keyword">public</code> <code class="java plain">Employee
                                                getEmployeeInJSON(</code><code class="java color1">@PathVariable</code>
                                                <code class="java plain">String name) {</code></div>
                                            <div class="line number13 index12 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">employee.setName(name);</code></div>
                                            <div class="line number14 index13 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">employee.setEmail(</code><code
                                                    class="java string">"employee1@genuitec.com"</code><code
                                                    class="java plain">);</code></div>
                                            <div class="line number15 index14 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java keyword">return</code> <code class="java plain">employee;</code>
                                            </div>
                                            <div class="line number16 index15 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">}</code></div>
                                            <div class="line number17 index16 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java color1">@RequestMapping</code><code class="java plain">(value
                                                = </code><code class="java string">"/{name}.xml"</code><code
                                                    class="java plain">, method = RequestMethod.GET, produces
                                                = </code><code class="java string">"application/xml"</code><code
                                                    class="java plain">)</code></div>
                                            <div class="line number18 index17 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java keyword">public</code> <code class="java plain">Employee
                                                getEmployeeInXML(</code><code class="java color1">@PathVariable</code>
                                                <code class="java plain">String name) {</code></div>
                                            <div class="line number19 index18 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">employee.setName(name);</code></div>
                                            <div class="line number20 index19 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">employee.setEmail(</code><code
                                                    class="java string">"employee1@genuitec.com"</code><code
                                                    class="java plain">);</code></div>
                                            <div class="line number21 index20 alt2"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java keyword">return</code> <code class="java plain">employee; </code>
                                            </div>
                                            <div class="line number22 index21 alt1"><code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code><code
                                                    class="java plain">} </code></div>
                                            <div class="line number23 index22 alt2"><code class="java plain">}</code>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    Заметьте, что не нужно добавлять&nbsp;@ResponseBody к каждому методу. Запустив приложение - получим
                    тот же результат.<br>
                    <br>


</@l.page>