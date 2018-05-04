<p class="CDB-Text CDB-Size-medium" style="margin-bottom: 20px;">
  * Fields marked with an asterisk are visible on your public profile,
  <% if (isInsideOrg) { %>
    <a href="//<%= organizationName %>.<%= accountHost %>/u/<%= username %>" target="_blank">
      <%= organizationName %>.<%= accountHost %>/u/<%= username %>
    </a>
  <% } else { %>
    <a href="//<%= username %>.carto.com/me" target="_blank">
      <%= username %>.carto.com/me
    </a>
  <% } %>
</p>

<form accept-charset="UTF-8" action="<%- formAction %>" method="post">
  <div class="FormAccount-row FormAccount-rowHorizontal">
    <div class="CDB-Text js-avatarSelector FormAccount-avatarSelector"></div>

    <div class="FormAccount-userType">
      <div class="FormAccount-rowLabel">
        <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.user_type') %></label>
      </div>
      <div class="FormAccount-rowData FormAccount-userRole">
        <% if (isViewer) { %>
          <div>
            <span class="UserRoleIndicator Viewer CDB-Text CDB-Size-small is-semibold u-altTextColor"><%= _t('profile.views.form.viewer') %></span>
            <% if (hasOrganization) { %>
              <a href="mailto:<%= orgDisplayEmail %>"><%= _t('profile.views.form.become_builder') %></a>
            <% } %>
          </div>
          <p class="CDB-Text CDB-Size-small u-altTextColor u-tSpace"><%= _t('profile.views.form.read_only') %></p>
        <% } else { %>
          <span class="UserRoleIndicator Builder CDB-Text CDB-Size-small is-semibold u-altTextColor"><%= _t('profile.views.form.builder') %></span>
          <p class="CDB-Text CDB-Size-small u-altTextColor u-tSpace"><%= _t('profile.views.form.write_access') %></p>
        <% } %>
      </div>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.name') %>*</label>
    </div>
    <div class="FormAccount-rowData">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--small u-rspace-s" id="user_name" name="user[name]" placeholder="<%= _t('profile.views.form.first_name') %>" size="30" type="text" value="<%= name %>">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--small" id="user_last_name" name="user[last_name]" placeholder="<%= _t('profile.views.form.last_name') %>" size="30" type="text" value="<%= last_name %>">

      <div class="FormAccount-rowInfo FormAccount-rowInfo--marginLeft">
        <p class="CDB-Text CDB-Size-small u-altTextColor"><%= _t('profile.views.form.info_public_name') %></p>
      </div>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.email') %></label>
    </div>

    <div class="FormAccount-rowData">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--med <% if (errors['email']) { %>has-error<% } %> <% if (!canChangeEmail) { %>is-disabled<% } %>" id="user_email" name="user[email]" size="30" type="text" value="<%= email %>" <% if (!canChangeEmail) { %>readonly="readonly"<% } %>>

      <% if (isInsideOrg) { %>
        <div class="FormAccount-rowInfo FormAccount-rowInfo--marginLeft">
          <p class="CDB-Text CDB-Size-small u-altTextColor"><%= _t('profile.views.form.your_url') %>: <%= organizationName %>.<%= accountHost %>/u/<%= username %></p>
        </div>
      <% } %>
    </div>

    <div class="FormAccount-rowInfo">
      <% if (errors['email']) { %>
        <p class="CDB-Text CDB-Size-small FormAccount-rowInfoText FormAccount-rowInfoText--error u-tSpace"><%= _t('account.views.form.errors.email_not_valid') %></p>
      <% } %>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.company_name') %></label>
    </div>
    <div class="FormAccount-rowData">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--med" id="user_company" name="user[company]" size="30" type="text" value="<%= company %>">
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.role') %></label>
    </div>
    <div class="FormAccount-rowData">
      <select class="CDB-SelectFake CDB-Text FormAccount-input FormAccount-input--med" id="user_job_role" name="user[job_role]">
        <option value="">Select one</option>

        <% jobRoles.forEach(function (role) { %>
          <option <% if (role === job_role) { %>selected<% } %>>
            <%= role %>
          </option>
        <% }); %>
      </select>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.phone') %></label>
    </div>
    <div class="FormAccount-rowData">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--med" id="user_phone" name="user[phone]" size="30" type="text" value="<%= phone %>">
    </div>
    <div class="FormAccount-rowInfo">
      <p class="CDB-Text CDB-Size-small u-altTextColor"></p>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.website') %>*</label>
    </div>
    <div class="FormAccount-rowData">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--med" id="user_website" name="user[website]" size="30" type="text" value="<%= website %>">
    </div>
    <div class="FormAccount-rowInfo">
      <p class="CDB-Text CDB-Size-small u-altTextColor"></p>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.location') %>*</label>
    </div>
    <div class="FormAccount-rowData">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--med" id="user_location" name="user[location]" size="30" type="text" value="<%= location %>">
    </div>
    <div class="FormAccount-rowInfo">
      <p class="CDB-Text CDB-Size-small u-altTextColor"></p>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.description') %>*</label>
    </div>
    <div class="FormAccount-rowData">
      <textarea class="CDB-Textarea CDB-Text FormAccount-textarea FormAccount-input FormAccount-input--totalwidth" cols="40" id="user_description" name="user[description]" rows="20"><%= description %></textarea>
    </div>
    <div class="FormAccount-rowInfo">
      <p class="CDB-Text CDB-Size-small u-altTextColor"></p>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.twitter') %>*</label>
    </div>
    <div class="FormAccount-rowData">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--med" id="user_twitter_username" name="user[twitter_username]" size="30" type="text" value="<%= twitter_username %>">
    </div>
    <div class="FormAccount-rowInfo">
      <p class="CDB-Text CDB-Size-small u-altTextColor"></p>
    </div>
  </div>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.disqus') %>*</label>
    </div>
    <div class="FormAccount-rowData">
      <input class="CDB-InputText CDB-Text FormAccount-input FormAccount-input--med" id="user_disqus_shortname" name="user[disqus_shortname]" placeholder="<%= _t('profile.views.form.disqus_placeholder') %>" size="30" type="text" value="<%= disqus_shortname %>">
      <div class="FormAccount-rowInfo FormAccount-rowInfo--marginLeft">
        <p class="CDB-Text CDB-Size-small u-altTextColor"><%= _t('profile.views.form.disqus_notified') %></p>
      </div>
    </div>
  </div>

  <div class="FormAccount-title">
    <p class="FormAccount-titleText"><%= _t('profile.views.form.jobs') %></p>
  </div>

  <span class="FormAccount-separator"></span>

  <div class="FormAccount-row">
    <div class="FormAccount-rowLabel">
      <label class="CDB-Text CDB-Size-medium is-semibold u-mainTextColor"><%= _t('profile.views.form.available_for_hire') %></label>
    </div>
    <div class="FormAccount-rowData">
      <div class="Toggler">
        <input name="user[available_for_hire]" type="hidden" value="0">
        <input id="available_for_hire" name="user[available_for_hire]" type="checkbox" value="<%= available_for_hire %>" <% if (available_for_hire) { %>checked="checked"<% } %>>
        <label for="available_for_hire"></label>
      </div>
      <div class="FormAccount-rowInfo u-lSpace--xl">
        <p class="CDB-Text CDB-Size-small u-altTextColor"><%= _t('profile.views.form.show_banner') %></p>
      </div>
    </div>
  </div>

  <div class="FormAccount-footer">
    <p class="FormAccount-footerText"></p>
    <button type="submit" class="CDB-Button CDB-Button--primary">
      <span class="CDB-Button-Text CDB-Text is-semibold CDB-Size-small u-upperCase"><%= _t('profile.views.form.save') %></span>
    </button>
  </div>
</form>
