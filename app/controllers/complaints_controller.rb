require 'net/http'
require 'uri'
require 'json'


class ComplaintsController < ApplicationController
  def new
    @complaint = Complaint.new
  end

  def create

    complaint_text = complaint_params[:complaint]

    client = Groq::Client.new(api_key: "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", model_id: "llama-3.1-8b-instant")
    response = client.chat("tell me if the given input is a complaint or not.\n\n here's the input #{complaint_text}\n\nonly answer with true or false. just one word")
    if (response["content"] == "True" || response["content"] == "true")

      url = URI.parse("https://localhost:5000/rag") # URL for the rag flask app.
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Post.new(url.path, { 'Content-Type' => 'application/json' })
      request.body = {
        "complaint": complaint_text
      }.to_json

      response = http.request(request)
      context = response.body
      augmented_query = ( context + complaint_text )
      # System prompt tailored for complaint handling
      system_prompt = (
        "Assign a product and sub_product to the following complaint based on the context provided. Respond with a JSON object and only the JSON object:
        {
        \"product\": \"string\",
        \"sub_product\": \"string\"
        }
        Use context from the complaint to determine the appropriate categories.
        Respond strictly and only in the JSON format I gave you above."
        )

      response = client.chat([
        {role: "system", content: system_prompt},
        {role: "user", content: augmented_query}
      ])
      rag_response = JSON.parse(response["content"])
      @complaint = Complaint.new(complaint_params.merge({product: rag_response["product"], sub_product: rag_response["sub_product"]}))
      if @complaint.save
        redirect_to new_complaint_path, notice: 'Complaint submitted successfully!'
      else
        render :new
      end
    end
  end

  private

  def complaint_params
    params.require(:complaint).permit(:username, :complaint)
  end
end