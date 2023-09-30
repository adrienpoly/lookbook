module Lookbook
  module DummyContentConcern
    extend ActiveSupport::Concern

    def example_html
      %(
        <!-- With Action -->
        <div data-component="app-form-button" data-coco="✔️">
          <form data-turbo="false" action="/request/success" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="fNPzDzYOgpjthOo9VMHQcUcHR2ockH1lM60-q-SXSaqbOx82xmFM-jyUInLjSYlfytJuhe80lBJDvCnnsm3X2g" autocomplete="off" />
            <div class="coco-button" data-component="app-button" data-coco="✔️" data-size-xl="md" data-size="sm" data-theme="primary" x-data="button" x-bind="root">
              <button type="submit" class="button-element" :disabled="disabled">
                <span class="button-inner">
                  <span class="button-content" x-ref="defaultContent">
                    Form button with action
                  </span>
                </span>
              </button>
            </div>
          </form>
        </div>
      )
    end

    def example_erb
      %(
        <%= coco_modal title: "This is the title", show: true do |modal| %>
          <div>
            <p>The modal content.</p>
            <p>Not wrapped in a dialog.</p>
          </div>
        <% end %>
      )
    end

    def example_ruby
      %(
        # With Confirmation
        coco_button(action: successful_request_path) do |button|
          button.with_confirmation do |confirm|
            confirm.with_text { "Destroy the planet? Really?" }
            confirm.with_button { "Fuck yeah" }
          end
          "Form button with confirmation"
        end
      )
    end
  end
end
