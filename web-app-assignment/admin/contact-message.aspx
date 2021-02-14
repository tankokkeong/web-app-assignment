﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="contact-message.aspx.cs" Inherits="web_app_assignment.admin.contact_message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Message</title>
    <link href="css/contact-message.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="message-container">
        <div class="message-title">
            <h2>Contact Message</h2>
        </div>

        <div class="table-container">
            <table class="table table-striped table-bordered">
              <thead>
                <tr class="bg-lightgreen text-light">
                  <th scope="col">Name</th>
                  <th scope="col">Contact Number</th>
                  <th scope="col">Email</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                  <%for (int i = 0; i < 5; i++)
                      { %>
                <tr>
                  <td>Mark</td>
                  <td>0123456789</td>
                  <td>demo@gmail.com</td>
                  <td>
                      <span class="badge badge-success action-btn" data-toggle="tooltip" data-placement="top" title="View"><i class="fas fa-eye"></i></span>
                      <span class="badge badge-danger action-btn" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fas fa-trash"></i></span>
                  </td>
                </tr>

                <tr>
                    <td>Jacob</td>
                    <td>0123456789</td>
                    <td>demo@gmail.com</td>
                    <td>
                        <span class="badge badge-success action-btn" data-toggle="tooltip" data-placement="top" title="View"><i class="fas fa-eye"></i></span>
                        <span class="badge badge-danger action-btn" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fas fa-trash"></i></span>
                    </td>
                </tr>
                <%}; %>
              </tbody>
            </table>
        </div>
    </div>
</asp:Content>
