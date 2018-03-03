# <span class="bigfirstletter">H</span>yperloop Gems

> The Hyperloop framework comprises of a family of gems which for the most part can be used independently (though some do depend on each other).

> See [Docs](/docs/dsl_overview) for detailed information on how to use these gems or [Tutorials](/tutorials) for working examples.

## Gems family and dependencies

<table class="gemsTable table table-sm table-hover">

  <thead>
      <tr class="table-header">
        <th class="first">
          Gem name
        </th>
        <th class="second">
          Dependencies
        </th>
        <th class="third">
          Description
        </th>

      </tr>
  </thead>

  <tbody>

      <tr class="table-active">
        <th scope="row" class="table-category" colspan="3">
          Installation Gems
        </th>
      </tr>

      <tr class="gem-cell-1">
        <td class="first">
          <%= link_to 'hyperloop', 'https://github.com/ruby-hyperloop/hyperloop'%>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
        One step integration of <b>Hyperloop</b> Gems with Rails.<br>
        It is the recommended approach to enjoy all <b>Hyperloop</b> functionalities. You can still control which code packages are loaded on client.
        </td>

      </tr>


      <tr class="gem-cell-1">
        <td class="first">
        </div><%= link_to 'hyperloop.js', 'https://github.com/ruby-hyperloop/hyperloop-js' , :class => 'express-yellow' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          <b>Hyperloop</b> for static sites, with no build process needed.

        </td>

      </tr>

	</tbody>
</table>


All Gems below come with <b>hyperloop</b> installation Gem <br>but they can be installed independently.


<table class="gemsTable table table-sm table-hover">

	<tbody>

      <tr class="table-active">
        <th class="table-category" colspan="3">
          Core Hyperloop Gems
        </th>


      </tr>


      <tr class="gem-cell-2">
        <td class="first">
          </div><%= link_to 'hyper-component', 'https://github.com/ruby-hyperloop/hyper-react', :class => 'component-blue' %>
        </td>
        <td class="second">
          <%= link_to 'hyper-store', 'https://github.com/ruby-hyperloop/hyper-store', :class => 'store-green' %>
        </td>
        <td class="descriptiontext third">
          The <b>hyper-component</b> gem implements Hyperloop's <b>Components</b>.
          <br>
          <b>Components</b> provides a Ruby DSL to Facebook's React. Much of the documentation on this site covers usage of this Gem.
        </td>
      </tr>

      <tr class="gem-cell-2">
        <td class="first">
          <%= link_to 'hyper-store', 'https://github.com/ruby-hyperloop/hyper-store', :class => 'store-green' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          The <b>hyper-store</b> gem implements Hyperloop's <b>Stores</b>.
          <br>
          <b>Stores</b> hold application state. <b>Stores</b> are Ruby classes that keep the dynamic parts of the state in special state variables
        </td>
      </tr>

      <tr class="gem-cell-2">
        <td class="first">
          <%= link_to 'hyper-model', 'https://github.com/ruby-hyperloop/hyper-mesh', :class => 'model-orange' %>
        </td>
        <td class="second">
          <%= link_to 'hyper-operation', 'https://github.com/ruby-hyperloop/hyper-operation', :class => 'operation-purple' %>
          <br><br>
          <%= link_to 'hyper-store', 'https://github.com/ruby-hyperloop/hyper-store', :class => 'store-green' %>

        </td>
        <td class="descriptiontext third">
          The <b>hyper-model</b> gem implements Hyperloop's <b>Models</b> and <b>Policies</b>. Providing <b>Hyperloop Models</b> as isomorphic ActiveRecord models. In addition your ActiveRecord models stay connected to your clients via push notifications
        </td>

      </tr>


      <tr class="gem-cell-2">
        <td class="first">
          <%= link_to 'hyper-operation', 'https://github.com/ruby-hyperloop/hyper-operation', :class => 'operation-purple' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          The <b>hyper-operation</b> gem implements Hyperloop's <b>Operations</b>.
          <br>
          <b>Operations</b> encapsulate business logic
        </td>

      </tr>




      <tr class="gem-cell-2">
        <td class="first">
          <%= link_to 'hyper-router', 'https://github.com/ruby-hyperloop/reactrb-router/tree/v2-4-0', :class => 'router-blue' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          The <b>hyper-router</b> gem provides a Ruby DSL to Facebook's React Router which is a React component that loads other components depending on the current URL.

        </td>

      </tr>


      <tr class="table-active">
        <th class="table-category" colspan="3">
          Tools, Testing and Debugging Gems
        </th>


      </tr>

      <tr class="gem-cell-3">
        <td class="first">

          <%= link_to 'hyper-spec', 'https://github.com/ruby-hyperloop/hyper-spec', :class => 'spec-red' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          With <b>hyper-spec</b> you can run isomorphic specs for all your <b>Hyperloop</b> code using RSpec. Everything runs as standard RSpec test specs.
        </td>

      </tr>

      <tr class="gem-cell-3">
        <td class="first">

          <%= link_to 'hyper-console', 'https://github.com/ruby-hyperloop/hyper-console', :class => 'console-purple' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          The <b>hyper-console</b> gem adds the console method to Kernel. If you call console from anywhere in your client code, it will open a new popup window, that is running an IRB style read-eval loop. The console window will compile what ever ruby code you type, and if it compiles, will send it to your main window for execution. The result (or error message) plus any console output will be displayed in the console window.
        </td>

      </tr>

      <tr class="gem-cell-3">
        <td class="first">

          <%= link_to 'hyper-trace', 'https://github.com/ruby-hyperloop/hyper-trace', :class => 'tracer-green' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          Method tracing and conditional breakpoints for Opal Ruby.
        </td>

      </tr>

      <tr class="gem-cell-3">
        <td class="first">

          <%= link_to 'Opal Hot Reloader', 'https://github.com/fkchang/opal-hot-reloader' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          For pure programmer joy, no more page refreshes.
        </td>

      </tr>

      <tr class="gem-cell-3">
        <td class="first">

          <%= link_to 'Opal Console', 'https://github.com/fkchang/opal-console' %>
        </td>
        <td class="second">

        </td>
        <td class="descriptiontext third">
          Opal in your browser. Great for testing.
        </td>

      </tr>

  </tbody>

</table>


<br><br>
