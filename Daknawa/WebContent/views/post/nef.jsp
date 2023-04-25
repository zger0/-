<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Form Components | Notika - Notika Admin Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <%@ include file="../common/formHeader.jsp"%>

    <!-- Color Picker area End-->
    <!-- Summernote area Start-->
    <div class="summernote-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="summernote-wrap mg-t-30">
                        <div class="cmp-tb-hd">
                            <h2>HTML Editor</h2>
                            <p>Super Simple WYSIWYG Editor on Bootstrap</p>
                        </div>
                        <div class="cmp-tb-hd bsc-smp-sm">
                            <label>Basic Example</label>
                        </div>
                        <div class="html-editor"></div>
                        <div class="cmp-tb-hd mg-t-20">
                            <h2>Click to edit</h2>
                            <p>You can edit content on the fly</p>
                        </div>
                        <div class="summernote-clickable">
                            <button class="btn btn-primary btn-sm hec-button">Click here to edit the content
                                </button>
                            <button class="btn btn-success btn-sm hec-save" style="display:none;">Save</button>
                        </div>
                        <div class="html-editor-click">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vehicula erat sit amet aliquam vehicula. Aliquam aliquet et risus et consequat. Quisque ultrices nulla eu magna vulputate, quis varius massa tempor. Suspendisse
                                sed condimentum purus, eget consequat dolor. Fusce aliquet ultricies porta. Nunc semper commodo leo at maximus. Duis maximus maximus leo, id lobortis nisi aliquam sit amet. Nullam vel ex id augue scelerisque congue sit
                                amet eget urna.</p>
                        </div>
                        <div class="cmp-tb-hd mg-t-20 air-mode-ctn">
                            <h2>Air-mode</h2>
                            <p>Air-mode gives clearer interface with hiddened toolbar. To reveal toolbar, select a text below where you want to shape up. </p>
                        </div>
                        <div class="html-editor-airmod" contenteditable="true">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce euismod quam vel lacinia facilisis. Sed condimentum nisi vel ante maximus, sit amet vestibulum leo euismod. Curabitur viverra faucibus nisi eu molestie. Donec convallis
                                finibus felis porttitor tristique. Nulla pretium est et ante dignissim.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../common/formFooter.jsp"%>

</body>

</html>