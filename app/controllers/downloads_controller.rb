class DownloadsController < ApplicationController
  before_action :get_lesson, only: [:index, :show]

  def show
    respond_to do |format|
      format.pdf { send_lesson_pdf }
      format.html { render_sample_html } if Rails.env.development?
    end
  end

  private

  def get_lesson
    @lesson = Lesson.find_by id: params[:lesson_id]
  end

  def create_user_pdf
    PdfService.new lesson
  end

  def send_user_pdf
    send_file create_lesson_pdf.to_pdf,
      filename: lesson_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

  def render_sample_html
    render template: "downloads/show", layout: "lessons_pdf",
      locals: { lesson: @lesson }
  end
end
