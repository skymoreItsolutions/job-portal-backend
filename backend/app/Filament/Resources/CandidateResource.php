<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CandidateResource\Pages;
use App\Filament\Resources\CandidateResource\RelationManagers;
use App\Models\Candidate;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Toggle;
use Filament\Tables\Columns\BadgeColumn;



use Filament\Forms\Components\Section;

class CandidateResource extends Resource
{
    protected static ?string $model = Candidate::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([


                Section::make('Personal Information')
                ->schema([
                    Grid::make(3)->schema([
                        TextInput::make('full_name')->required()->placeholder('Enter Full Name')->columnSpan(2),
                        DatePicker::make('dob')->required()->placeholder('Select Date of Birth'),
                        TextInput::make('gender')->required()->placeholder('Gender')->columnSpan(2),
                        Textarea::make('address')->columnSpanFull()->placeholder('Enter Address'),
                        TextInput::make('city')->placeholder('City'),
                        TextInput::make('state')->placeholder('State'),
                       
                        TextInput::make('email')->email()->required()->placeholder('Email Address')->columnSpanFull(),
                    ]),
                ]),
    
            // Educational Information Section
            Section::make('Educational Information')
                ->schema([
                    Grid::make(2)->schema([
                        TextInput::make('degree')->placeholder('Degree')->columnSpan(2),
                        TextInput::make('specialization')->placeholder('Specialization')->columnSpan(2),
                        TextInput::make('college_name')->placeholder('College Name'),
                        TextInput::make('passing_marks')->placeholder('Passing Marks'),
                        Toggle::make('pursuing')->label('Currently Pursuing')->default(false),
                    ]),
                ]),
    
            // Experience Information Section
            Section::make('Experience Information')
                ->schema([
                    Grid::make(3)->schema([
                        TextInput::make('experience_years')->numeric()->placeholder('Years of Experience')->columnSpan(2),
                        TextInput::make('experience_months')->numeric()->placeholder('Months of Experience'),
                        TextInput::make('job_title')->placeholder('Job Title')->columnSpanFull(),
                        Textarea::make('job_roles')->placeholder('Job Roles (comma separated)')->columnSpanFull(),
                        TextInput::make('company_name')->placeholder('Company Name'),
                        TextInput::make('current_salary')->placeholder('Current Salary')->columnSpan(2),
                        DatePicker::make('start_date')->placeholder('Start Date'),
                    ]),
                ]),
    
            // Preferences Section
            Section::make('Job Preferences')
                ->schema([
                    Grid::make(2)->schema([
                        Toggle::make('prefers_night_shift')->label('Prefers Night Shift')->default(false),
                        Toggle::make('prefers_day_shift')->label('Prefers Day Shift')->default(true),
                        Toggle::make('work_from_home')->label('Work From Home')->default(false),
                        Toggle::make('work_from_office')->label('Work From Office')->default(true),
                        Toggle::make('field_job')->label('Field Job')->default(false),
                        TextInput::make('employment_type')->placeholder('Preferred Employment Type'),
                        TextInput::make('preferred_language')->placeholder('Preferred Language'),
                    ]),
                ]),
    
            // Resume & Skills Section
            Section::make('Resume & Skills')
                ->schema([
                    Grid::make(2)->schema([
                        TextInput::make('resume')->placeholder('Upload Resume File'),
                        Textarea::make('skills')->placeholder('Skills (comma separated)'),
                    ]),
                ]),
    
            // Account Information Section
            Section::make('Account Information')
                ->schema([
                    Grid::make(2)->schema([
                        Toggle::make('active_user')->label('Active User')->default(true),
                      
                    ]),
                ]),
               
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('full_name')->searchable()->sortable()->icon('heroicon-o-user'),
                TextColumn::make('email'),

                TextColumn::make('gender')->badge(),
                TextColumn::make('city'),
                TextColumn::make('degree')->label('Education')->icon('heroicon-o-academic-cap'),
                IconColumn::make('pursuing')
                    ->boolean()
                    ->colors(['danger' => false, 'success' => true])
                    ->label('Pursuing?'),
                IconColumn::make('work_from_home')
                    ->boolean()
                    ->label('WFH')
                    ->icon('heroicon-o-home'),
    
                TextColumn::make('skills')->limit(25),
                TextColumn::make('total_jobs_applied')->label('Applied'),
                TextColumn::make('total_job_views')->label('Views'),
                IconColumn::make('active_user')
                    ->boolean()
                    ->label('Active')
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle'),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCandidates::route('/'),
            'create' => Pages\CreateCandidate::route('/create'),
            'edit' => Pages\EditCandidate::route('/{record}/edit'),
        ];
    }
}
